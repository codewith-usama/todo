// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/data/services/storage/storage_repository.dart';

class HomeController extends GetxController {
  StorageRepository storageRepository;
  HomeController({required this.storageRepository});

  final tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(storageRepository.readTask());
    ever(tasks, (_) => storageRepository.writeTask(tasks));
  }

  @override
  void onClose() {
    super.onClose();
    
  }
}
