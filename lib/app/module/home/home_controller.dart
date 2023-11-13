import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/data/services/storage/storage_repository.dart';

class HomeController extends GetxController {
  StorageRepository storageRepository;
  HomeController({required this.storageRepository});

  final tasks = <Task>[].obs;
  final editController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final chipIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(storageRepository.readTask());
    ever(tasks, (_) => storageRepository.writeTask(tasks));
  }

  @override
  void onClose() {
    super.onClose();
    editController.dispose();
  }

  void changeChipIndex(int value) {
    chipIndex.value = value;
  }

  bool addTask(Task task) {
    if (tasks.contains(task)) return false;
    tasks.add(task);
    return true;
  }
}
