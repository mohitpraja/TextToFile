import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController role = TextEditingController();
  TextEditingController about = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  double textFieldSpacing = 18;

  Future writeTextToFile() async {}

  shareFile() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/my_file.txt');
    if (await file.exists()) {
      Share.shareXFiles([XFile(file.path)]);
    }
  }

  isValid(value, msg) {
    if (value == null || value.isEmpty) {
      return msg;
    }
    return null;
  }

  loader({String? title}) {
    Get.defaultDialog(
      barrierDismissible: false,
      title: '',
      titlePadding: EdgeInsets.zero,
      radius: 5,
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            CircularProgressIndicator(
              color: Colors.deepPurple,
              backgroundColor: Colors.grey.withOpacity(0.6),
            ),
            const SizedBox(width: 15),
            Text(title ?? 'Submitting ...',
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: Get.width * 0.05))
          ],
        ),
      ),
    );
  }

  submitForm() async {
    loader();
    final Directory directory = await getApplicationDocumentsDirectory();
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    final File file = File('${directory.path}/files/file_$id.txt');
    String textString =
        'Name : ${name.text} \nEmail : ${email.text} \nPhone : ${phone.text} \nRole : ${role.text} \nAbout : ${about.text}';
    await file.writeAsString(textString).then((value) {
      Get.back();
      Get.bottomSheet(Container(
        height: 80,
        color: Colors.white,
        child: const Text("Your file is created & added to files "),
      ));
    });
  }
}
