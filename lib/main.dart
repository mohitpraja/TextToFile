import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texttofile/core/allpages.dart';
import 'package:texttofile/core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TextToFile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      getPages: allpages,
    );
  }
}
