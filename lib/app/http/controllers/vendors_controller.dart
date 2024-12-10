import 'package:restapi_vania/app/models/vendors.dart';
import 'package:vania/vania.dart';

class VendorsController extends Controller {

     Future<Response> index() async {
          return Response.json({'message':'Hello World'});
     }

     Future<Response> create(Request request) async {
      request.validate({
        'vend_name': 'required',
        'vend_address': 'required',
        'vend_city': 'required',
        'vend_state': 'required',
        'vend_zip': 'required',
        'country': 'required'
      }, {
        'vend_name.required': 'data cant be empty',
        'vend_address.required': 'data cant be empty',
        'vend_city.required': 'data cant be empty',
        'vend_state.required': 'data cant be empty',
        'vend_zip.required': 'data cant be empty',
        'country.required': 'data cant be empty'
      });

      final requestData = request.input();
      requestData['created_at'] = DateTime.now().toIso8601String();

      final existingData =
        await Vendors().query().where('vend_name', '=', requestData['vend_name']).first();
      if (existingData != null) {
        return Response.json(
          {"massage": "Data already exist"},
          410
        );
      }

      await Vendors().query().insert(requestData);

          return Response.json({
            "massage": "Data added successfully",
            "data": Vendors,
          }, 201);
     }

     Future<Response> store(Request request) async {
          return Response.json({});
     }

     Future<Response> show(int id) async {
          return Response.json({});
     }

     Future<Response> edit(int id) async {
          return Response.json({});
     }

     Future<Response> update(Request request,int id) async {
          return Response.json({});
     }

     Future<Response> destroy(int id) async {
          return Response.json({});
     }
}

final VendorsController vendorsController = VendorsController();

