import 'package:isar/isar.dart';
import 'package:task_app/data/isar/models/task_dto.dart';
import 'package:task_app/domain/repositories/models/task.dart';

class TaskRepository {
  TaskRepository({required this.localProvider});
  final Isar localProvider;
  Stream<List<Task>> listenTasks(){
    return localProvider
        .collection<TaskDto>()
        .buildQuery<TaskDto>()
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }
  List<TaskDto> getTasks() {
    return localProvider
        .collection<TaskDto>()
        .buildQuery<TaskDto>()
        .findAllSync();
  }

  Future<int> insertTask(Task task) async {
    return localProvider.writeTxnSync(
      () => localProvider
          .collection<TaskDto>()
          .putSync(TaskDto.fromDomainModel(task)),
    );
  }

  Future<int> updateTask(Task task) async {
    return localProvider.writeTxnSync(
      () => localProvider
          .collection<TaskDto>()
          .putSync(TaskDto.fromDomainModel(task)),
    );
  }

  Future<bool> deleteTask(int id) async {
    return localProvider.writeTxnSync(
      () => localProvider.collection<TaskDto>().deleteSync(id),
    );
  }
}
