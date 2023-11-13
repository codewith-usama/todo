import 'package:get/get.dart';
import 'package:todo_app/app/data/providers/task/task_provider.dart';
import 'package:todo_app/app/data/services/storage/storage_repository.dart';
import 'package:todo_app/app/module/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        storageRepository: StorageRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}
