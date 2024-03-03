import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:texttofile/core/routes.dart';
import 'package:texttofile/feature/files/binding/files_binding.dart';
import 'package:texttofile/feature/files/files_view.dart';
import 'package:texttofile/feature/home/binding/home_binding.dart';
import 'package:texttofile/feature/home/view/home_view.dart';


List<GetPage> allpages=[
  GetPage(name: Routes.home, page: () =>  const HomeView(),binding:HomeBinding()),
  GetPage(name: Routes.files, page: () =>  const FileView(),binding:FileBinding()),
];