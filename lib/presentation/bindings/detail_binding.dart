import 'package:get/get.dart';
import '../controllers/detail_controller.dart';

class PropertyDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
        DetailController()); // Bind DetailController to the dependency injection system
  }
}
