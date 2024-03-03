import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texttofile/feature/home/controller/home_controller.dart';
import 'package:texttofile/widgets/custom_textform.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "TextToFile",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.sticky_note_2_sharp,
                  color: Colors.white,
                ))
          ],
        ),
        body: Container(
          height: Get.height,
          alignment: Alignment.center,
          margin: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                    key: controller.formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: controller.name,
                          hintText: 'Name ',
                          validator: (value) =>
                              controller.isValid(value, 'Name Required'),
                        ),
                        SizedBox(
                          height: controller.textFieldSpacing,
                        ),
                        CustomTextFormField(
                          controller: controller.email,
                          hintText: 'Email',
                          validator: (value) =>
                              controller.isValid(value, 'Email Required'),
                        ),
                        SizedBox(
                          height: controller.textFieldSpacing,
                        ),
                        CustomTextFormField(
                          controller: controller.phone,
                          hintText: 'Phone',
                          inputType: TextInputType.number,
                          validator: (value) =>
                              controller.isValid(value, 'Phone Required'),
                        ),
                        SizedBox(
                          height: controller.textFieldSpacing,
                        ),
                        CustomTextFormField(
                          controller: controller.role,
                          hintText: 'Role',
                          validator: (value) =>
                              controller.isValid(value, 'Role Required'),
                        ),
                        SizedBox(
                          height: controller.textFieldSpacing,
                        ),
                        CustomTextFormField(
                          controller: controller.about,
                          hintText: 'About',
                          validator: (value) =>
                              controller.isValid(value, 'About Required'),
                        ),
                        SizedBox(
                          height: controller.textFieldSpacing,
                        ),
                        SizedBox(
                          width: Get.width,
                          child: MaterialButton(
                            color: Colors.deepPurple,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Submit'.toUpperCase(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            onPressed: () {
                              if (controller.formKey.currentState!.validate()) {
                                controller.submitForm();
                              }
                            },
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
