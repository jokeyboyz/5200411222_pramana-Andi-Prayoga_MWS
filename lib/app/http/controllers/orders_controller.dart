import 'package:restapi_vania/app/models/orders.dart';
import 'package:vania/vania.dart';

class OrdersController extends Controller {

     Future<Response> index() async {
          return Response.json({'message':'Hello World'});
     }

     Future<Response> create(Request request) async {
      request.validate({
        'order_date': 'required'
      }, {
        'order_date.required': 'data cant be empty'
      });

      final requestData = request.input();
      requestData['created_at'] = DateTime.now().toIso8601String();

      final existingData =
        await Orders().query().where('order_date', '=', requestData['order_date']).first();
      if (existingData != null) {
        return Response.json(
          {"massage": "Data already exist"},
          410
        );
      }

      await Orders().query().insert(requestData);

          return Response.json({
            "massage": "Data added successfully",
            "data": Orders,
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

final OrdersController ordersController = OrdersController();

