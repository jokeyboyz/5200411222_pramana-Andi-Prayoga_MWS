import 'package:restapi_vania/app/models/products.dart';
import 'package:vania/vania.dart';

class ProductsController extends Controller {

     Future<Response> index() async {
          return Response.json({'message':'Hello World'});
     }

     Future<Response> create(Request request) async {
      request.validate({
        'prod_name': 'required',
        'prod_price': 'required',
        'prod_desc': 'required'
      }, {
        'prod_name.required': 'data cant be empty',
        'prod_price.required': 'data cant be empty',
        'prod_desc.required': 'data cant be empty'
      });

      final requestData = request.input();
      requestData['created_at'] = DateTime.now().toIso8601String();

      final existingData =
        await Products().query().where('prod_name', '=', requestData['prod_name']).first();
      if (existingData != null) {
        return Response.json(
          {"massage": "Data already exist"},
          410
        );
      }

      await Products().query().insert(requestData);

          return Response.json({
            "massage": "Data added successfully",
            "data": Products,
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

final ProductsController productsController = ProductsController();

