import 'package:get/get.dart';
import 'package:texttofile/feature/files/controller/files_controller.dart';

class FileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FileController());
  }
}
