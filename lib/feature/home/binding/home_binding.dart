import 'package:get/get.dart';
import 'package:texttofile/feature/home/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
  
}