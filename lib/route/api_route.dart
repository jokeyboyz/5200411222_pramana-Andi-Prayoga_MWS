import 'package:restapi_vania/app/http/controllers/customers_controller.dart';
import 'package:restapi_vania/app/http/controllers/orderitems_controller.dart';
import 'package:restapi_vania/app/http/controllers/orders_controller.dart';
import 'package:restapi_vania/app/http/controllers/products_controller.dart';
import 'package:restapi_vania/app/http/controllers/vendors_controller.dart';
import 'package:vania/vania.dart';

class ApiRoute implements Route {
  @override
  void register() {
    Router.post('/create-customers', customersController.create);
    Router.get('/create-customers', customersController.create);
    Router.put('/create-customers', customersController.create);
    Router.delete('/create-customers', customersController.create);
    Router.post('/create-orderitems', orderitemsController.create);
    Router.post('/create-products', productsController.create);
    Router.post('/create-vendors', vendorsController.create);
    Router.post('/create-orders', ordersController.create);
  }
}
