import 'dart:developer';

import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileController extends GetxController {
  RxList allFilePath = [].obs;
  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    fetchFiles();
    super.onInit();
  }

  fetchFiles() async {
    log("fetch files cld");
    List<dynamic> fileList = [];
    var dir = await getApplicationDocumentsDirectory();
    log("fetch dir : $dir");
    dir.list().forEach((element) {
      RegExp regExp = RegExp(".(txt)", caseSensitive: false);
      if (regExp.hasMatch('$element')) fileList.add(element);
      allFilePath.value = fileList.reversed.toList();
      allFilePath.refresh();
    });
    Future.delayed(
      const Duration(seconds: 1),
      () => isLoading.value = false,
    );
  }

  getFileNameByPath(filePath) {
    return path.basename(filePath);
  }

  openFile(filePath) {
    OpenFilex.open(filePath);
  }

  shareFile(filePath) async {
    Share.shareXFiles([XFile(filePath)]);
  }
}
