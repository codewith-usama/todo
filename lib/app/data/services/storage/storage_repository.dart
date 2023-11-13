import 'package:todo_app/app/data/models/task.dart';
import 'package:todo_app/app/data/providers/task/task_provider.dart';

class StorageRepository {
  TaskProvider taskProvider;
  StorageRepository({required this.taskProvider});

  List<Task> readTask() => taskProvider.readTasks();

  void writeTask(List<Task> tasks) => taskProvider.writeTask(tasks);
}
