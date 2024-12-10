import 'package:vania/vania.dart';

class CreateVendorsTable extends Migration {

  @override
  Future<void> up() async{
   super.up();
   await createTableNotExists('vendors', () {
      integer("vend_id", length: 5);
      string("vend_name", length: 50);
      text("vend_address");
      text("vend_city");
      string("vend_state", length: 5);
      string("vend_zip", length: 7);
      string("country", length: 25);
      timeStamps();
    });
  }
  
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('vendors');
  }
}
