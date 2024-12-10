import 'package:restapi_vania/app/models/orderitems.dart';
import 'package:vania/vania.dart';

class OrderitemsController extends Controller {

     Future<Response> index() async {
          return Response.json({'message':'Hello World'});
     }

     Future<Response> create(Request request) async {
      request.validate({
        'quantity': 'required',
        'size': 'required'
      }, {
        'quantity.required': 'data cant be empty',
        'size.required': 'data cant be empty'
      });

      final requestData = request.input();
      requestData['created_at'] = DateTime.now().toIso8601String();

      final existingData =
        await Orderitems().query().where('order_num', '=', requestData['order_num']).first();
      if (existingData != null) {
        return Response.json(
          {"massage": "Data already exist"},
          410
        );
      }

      await Orderitems().query().insert(requestData);

          return Response.json({
            "massage": "Data added successfully",
            "data": Orderitems,
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

final OrderitemsController orderitemsController = OrderitemsController();

