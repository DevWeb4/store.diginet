<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cash;
use App\Sale;
use App\Person;
use App\Store;
use App\Account;
use App\Extra;
use App\Product;
use App\Bill;
use App\CreditNote;

use Afip;
use Auth;

class SaleController extends Controller
{
    public function index()
    {
        return view('sales.sale');
    }

    public function addExtra(Request $request)
    {
        $input = $request->all();    
        $lastCash = $this->lastCash();

        $extra = Extra::create([
            "description"=>$input['description'],
            "amount"=>$input['amount'],
            "cash_id"=>$lastCash->original['data'][0]->id,
            "user_id"=> Auth::user()->id,
            "client_id"=>0
        ]);

        return response()->json(['statusCode' => 200, 'data' => $extra]);
    }
    
    public function getStore(){
        return response()->json(['statusCode' => 200, 'data' => Auth::user()->store]);
    }
    public function indexBilling($id)
    {
        $id_ = explode("-", $id);
        $origin = $id_[1];

        $billing = Sale::with(['client','cash.store', 'bill'])->get()->find($id_[0]);
        return view('sales.billing', compact('billing','origin'));
    }  
    
    public function getBillings($id)
    {
        //$billings = Sale::get()->where('cash_id', '=', $id);
        $billings = Sale::where('cash_id', '=', $id)
            ->with('bill')
            ->orderBy('created_at', 'DESC')
            ->get();
        return response(['statusCode' => 200, 'data' => $billings]);
    }    

    public function getLastCash(Request $request)
    {      
        $lastCash = $this->lastCash();

        if($lastCash->original['statusCode'] == 404){
            return response()->json(['statusCode' => $lastCash->original['statusCode']]);
        }
        return response()->json(['statusCode' => 200, 'data' => $lastCash->original['data']]);
    }

    public function cancelBill(Request $request, $id){

        $input = $request->all();

        $afip = new Afip(array('CUIT' => Auth::user()->store->organization->cuit));
        $punto_de_venta = 1;

        $tipo_de_nota = $input['tipo_de_nota']; // 3 = Nota de Crédito A
        $last_voucher = $afip->ElectronicBilling->GetLastVoucher($punto_de_venta, $tipo_de_nota);

        /**
         * Numero del punto de venta de la Factura
         * asociada a la Nota de Crédito
         **/
        $punto_factura_asociada = 1;

        /**
         * Tipo de Factura asociada a la Nota de Crédito
         **/
        $tipo_factura_asociada = $input['tipo_factura_asociada']; // 1 = Factura A

        /**
         * Numero de Factura asociada a la Nota de Crédito
         **/
        $numero_factura_asociada = $input['numero_factura_asociada'];


        $concepto = 1;

        $tipo_de_documento = $input['tipo_de_documento'];

            /**
             * Numero de documento del comprador (0 para consumidor final)
             **/
        $numero_de_documento = $input['numero_de_documento'];
        $numero_de_nota = $last_voucher+1;

        $fecha = date('Y-m-d');


        $importe_gravado = $input['importe_gravado'];
        $importe_exento_iva = 0;
        $importe_iva = $input['importe_iva'];


        $fecha_servicio_desde = null;
        $fecha_servicio_hasta = null;
        $fecha_vencimiento_pago = null;
            

        $data = array(
            'CantReg'       => 1, // Cantidad de Notas de Crédito a registrar
            'PtoVta'        => $punto_de_venta,
            'CbteTipo'      => $tipo_de_nota,
            'Concepto'      => $concepto,
            'DocTipo'       => $tipo_de_documento,
            'DocNro'        => $numero_de_documento,
            'CbteDesde' => $numero_de_nota,
            'CbteHasta' => $numero_de_nota,
            'CbteFch'       => intval(str_replace('-', '', $fecha)),
            'FchServDesde'  => $fecha_servicio_desde,
            'FchServHasta'  => $fecha_servicio_hasta,
            'FchVtoPago'    => $fecha_vencimiento_pago,
            'ImpTotal'      => $importe_gravado + $importe_iva + $importe_exento_iva,
            'ImpTotConc'=> 0, // Importe neto no gravado
            'ImpNeto'       => $importe_gravado,
            'ImpOpEx'       => $importe_exento_iva,
            'ImpIVA'        => $importe_iva,
            'ImpTrib'       => 0, //Importe total de tributos
            'MonId'         => 'PES', //Tipo de moneda usada en la Nota de Crédito ('PES' = pesos argentinos)
            'MonCotiz'      => 1, // Cotización de la moneda usada (1 para pesos argentinos)
            'CbtesAsoc' => array( //Factura asociada
                array(
                    'Tipo'          => $tipo_factura_asociada,
                    'PtoVta'        => $punto_factura_asociada,
                    'Nro'           => $numero_factura_asociada,
                )
            ),
            'Iva' => array( // Alícuotas asociadas a la Nota de Crédito
                array(
                    'Id'            => 5, // Id del tipo de IVA (5 = 21%)
                    'BaseImp'       => $importe_gravado,
                    'Importe'       => $importe_iva
                )
            ),
        );


        $res = $afip->ElectronicBilling->CreateVoucher($data);

        $sale = Sale::find($id);
        $sale->invoiced = 0;

        CreditNote::create([
            "type"          => $input['type'],
            "cae"           => $res['CAE'],
            "cae_fch_vto"   => $res['CAEFchVto'],
            "bill_id" => $sale->bill_id,
            "sale_id" => $id
        ]);

        $sale->update();

        return $res;
        /*var_dump(array(
            'cae' => $res['CAE'], //CAE asignado a la Nota de Crédito
            'vencimiento' => $res['CAEFchVto'] //Fecha de vencimiento del CAE
        ));*/
    }

    public function afipWS(Request $request, $id){
        $input = $request->all();

        $afip = new Afip(array('CUIT' => Auth::user()->store->organization->cuit));

        $sale = Sale::find($id);
        $importe_total =  $sale->credit_payment;
        $iva_21 = number_format(($importe_total/100)*21, 2, '.', '');

        $punto_de_venta = 1;
        $tipo_de_factura = $input['tipo_de_factura']; // 1 = Factura A

        /**
         * Número de la ultima Factura A
         **/
        $last_voucher = $afip->ElectronicBilling->GetLastVoucher($punto_de_venta, $tipo_de_factura);
        $concepto = 1;
        $tipo_de_documento = $input['tipo_de_documento'];
        $numero_de_documento = $input['numero_de_documento'];

        /**
         * Numero de factura
         **/
        $numero_de_factura = $last_voucher+1;
        $fecha = date('Y-m-d');

        $importe_gravado = $importe_total;

        /**
         * Importe exento al IVA
         **/
        $importe_exento_iva = 0;

        /**
         * Importe de IVA
         **/
        $importe_iva = $iva_21;

        $fecha_servicio_desde = null;
        $fecha_servicio_hasta = null;
        $fecha_vencimiento_pago = null;
        

        $data = array(
            'CantReg'       => 1, // Cantidad de facturas a registrar
            'PtoVta'        => $punto_de_venta,
            'CbteTipo'      => $tipo_de_factura,
            'Concepto'      => $concepto,
            'DocTipo'       => $tipo_de_documento,
            'DocNro'        => $numero_de_documento,
            'CbteDesde' => $numero_de_factura,
            'CbteHasta' => $numero_de_factura,
            'CbteFch'       => intval(str_replace('-', '', $fecha)),
            'FchServDesde'  => $fecha_servicio_desde,
            'FchServHasta'  => $fecha_servicio_hasta,
            'FchVtoPago'    => $fecha_vencimiento_pago,
            'ImpTotal'      => $importe_gravado + $importe_iva + $importe_exento_iva,
            'ImpTotConc'=> 0, // Importe neto no gravado
            'ImpNeto'       => $importe_gravado,
            'ImpOpEx'       => $importe_exento_iva,
            'ImpIVA'        => $importe_iva,
            'ImpTrib'       => 0, //Importe total de tributos
            'MonId'         => 'PES', //Tipo de moneda usada en la factura ('PES' = pesos argentinos)
            'MonCotiz'      => 1, // Cotización de la moneda usada (1 para pesos argentinos)
            'Iva'           => array(// Alícuotas asociadas al factura
                array(
                    'Id'            => 5, // Id del tipo de IVA (5 = 21%)
                    'BaseImp'       => $importe_gravado,
                    'Importe'       => $importe_iva
                )
            ),
        );

        $res = $afip->ElectronicBilling->CreateVoucher($data);

        $bill = Bill::create([
            "type"          => $input['type'],
            "cae"           => $res['CAE'],
            "comp_n"        => $numero_de_factura,
            "cae_fch_vto"   => $res['CAEFchVto'],
            "amount"   => $importe_total,
            "iva"   => $iva_21,
            "tax"   => 21,
            "identification" => $numero_de_documento
        ]);

        $sale->bill_id = $bill->id;
        $sale->invoiced = 1;

        $sale->update();

        /**
         * Mostramos por pantalla los datos de la nueva Factura
         **/
        /*var_dump(array(
                'cae' => $res['CAE'], //CAE asignado a la Factura
                'vencimiento' => $res['CAEFchVto'] //Fecha de vencimiento del CAE
        ));*/

        return response()->json(["statusCode" => 200, "data" => $bill]);
    }

    public function saveClient(Request $request, $id)
    {
        $input = $request->all();  
        $sale = Sale::find($id);      
        //$fee->update($request->all());
        $condition = ["identification" => $input['identification']];
        if(strlen($input['identification']) == 7 || strlen($input['identification']) == 8 || $input['name'] != ''){
            $personInfo = [
                "name" => $input['name'],
                "organization_id"=> Auth::user()->store->organization->id,
                "identification_type"=> 1,
                "email"=> $input['email'],
                "phone"=> $input['phone'],
                "address"=> $input['address'],
                "category"=> 1,
            ];
        
            $person =Person::updateOrCreate($condition,$personInfo);
            $sale['client_id'] = $person->id;

            $sale->update();
        }

        return response()->json(["statusCode" => 200, "data" => $person]);
    }

    public function store(Request $request){  
        $lastCash = $this->lastCash();

        if($lastCash->original['statusCode'] == 404){
            return response()->json(['statusCode' => $lastCash->original['statusCode']]);
        }

        $input = $request->all();        
        $input['payment']['client_id'] = 0;
        $condition = ["identification" => $input['client']['identification']];

        if(strlen($input['client']['identification']) == 7 || strlen($input['client']['identification']) == 8 || $input['client']['name'] != ''){
            $personInfo = [
                "name" => $input['client']['name'],
                "organization_id"=> Auth::user()->store->organization->id,
                "identification_type"=> 1,
                "email"=> $input['client']['email'],
                "phone"=> $input['client']['phone'],
                "address"=> $input['client']['address'],
                "category"=> 1,
            ];
        
            $person =Person::updateOrCreate($condition,$personInfo);
            $input['payment']['client_id'] = $person->id;

        }

        $input['payment']['user_id'] = Auth::user()->id;
        $input['payment']['cash_id'] = $lastCash->original['data'][0]->id;
        
        $sale = Sale::create($input['payment']);

        foreach ($input['products'] as $id) {
            $product = Product::find($id);
            $product->stock -= 1; 

            $product->update();
        }

        if($input['payment']['personal_account_payment']>0) {
            Account::create([
                "sale_id"=>$sale->id,
                "person_id"=>$person->id,
                "total_account"=>$input['payment']['personal_account_payment'],
                "rest_account"=>$input['payment']['personal_account_payment'],
            ]);
        }

        return response()->json(['statusCode' => 200, 'id' => $sale->id]);
    }

    public function lastCash(){
        $lastCash = Cash::where('store_id', '=', Auth::user()->store_id)
            ->where('status', '=', 1)
            ->with('extras')
            ->orderBy('created_at', 'DESC')
            ->take(1)
            ->get();
            
        if(count($lastCash) == 0){
            return response()->json(['statusCode' => 404, 'data' => '']);
        }
        return response()->json(['statusCode' => 200, 'data' => $lastCash]);
    }

    public function openCash(Request $request)
    {      
        $cash = Cash::create([
            'status' => 1,
            'initial_cash' => $request->cash_value,
            'final_cash' => 0,
            'initial_user_id' => Auth::user()->id,
            'final_user_id' => 0,
            'store_id' => Auth::user()->store_id,
        ]);
        return response()->json(['statusCode' => 200, 'data' => $cash]);
    }

    public function closeCash(Request $request)
    {
        $cash = Cash::find($request->id);

        $cash->status = 0;
        $cash->final_cash = $request->cash_value;
        $cash->final_user_id = Auth::user()->id;
        $cash->update();

        return response()->json(['statusCode' => 200, 'data' => $cash]);
    }

    public function deleteExtra($id)
    {
        $extra = Extra::find($id);
        $extra->delete();

        return response()->json(["statusCode" => 200]);
    }
    
}
