import 'dart:developer';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class FileController extends GetxController {
  RxList allFilePath = [].obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    fetchFiles();
    super.onInit();
  }

  fetchFiles() async {

    log("fetch files cld");
    List<dynamic> fileList = [];
    var dir = await getApplicationDocumentsDirectory();
    log("fetch dir : $dir");
    dir.list().forEach((element) {
      RegExp regExp =
          RegExp(".(txt)", caseSensitive: false);
      if (regExp.hasMatch('$element')) fileList.add(element);
      allFilePath.value = fileList.reversed.toList();
      allFilePath.refresh();
    });
  }

  getFileNameByPath(filePath){
    return path.basename(filePath);
  }
}
