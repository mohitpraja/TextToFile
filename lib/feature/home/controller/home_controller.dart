import 'dart:developer';
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

  isValid(value, msg) {
    if (value == null || value.isEmpty) {
      return msg;
    } else if (value.length < 3) {
      return 'value contain atleast 3 letter';
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
    String id =
        DateTime.now().millisecondsSinceEpoch.toString().substring(0, 7);
    final File file =
        File('${directory.path}/${name.text.substring(0, 3)}_$id.txt');
    String textString =
        'Name : ${name.text} \nEmail : ${email.text} \nPhone : ${phone.text} \nRole : ${role.text} \nAbout : ${about.text}';
    await file.writeAsString(textString).then((value) {
      log("done : ${file.path}");
      Future.delayed(
        const Duration(seconds: 1),
        () {
          Get.back();
          showSnackBar('Your file is created & added to files');
        },
      );
    });
  }

  showSnackBar(text) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        backgroundColor: Colors.black,
        shape: const Border(top: BorderSide(width: 3, color: Colors.green)),
        content: Text(
          text,
          style: const TextStyle(color: Colors.white),
        )));
  }
}
