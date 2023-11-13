import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app/data/services/storage/storage_service.dart';
import 'package:todo_app/app/module/home/home_binding.dart';
import 'package:todo_app/app/module/home/home_view.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync(() => StorageService().init());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo app using GetX',
      home: const HomeView(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
