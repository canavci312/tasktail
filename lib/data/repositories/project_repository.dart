import 'package:isar/isar.dart';
import 'package:task_app/data/isar/models/project_dto.dart';
import 'package:task_app/data/isar/models/task_dto.dart';
import 'package:task_app/domain/repositories/models/project.dart';

class ProjectRepository {
  ProjectRepository({required this.isar});
  final Isar isar;

  //stream projects

  Stream<List<Project>> listenActiveProjects() {
    return isar
        .collection<ProjectDto>()
        .filter()
        .archivedEqualTo(false)
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  Stream<List<Project>> listenAllProjects() {
    return isar
        .collection<ProjectDto>()
        .buildQuery<ProjectDto>()
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  List<Project> getProjects() {
    return isar
        .collection<ProjectDto>()
        .buildQuery<ProjectDto>()
        .findAllSync()
        .map((e) => e.toDomainModel())
        .toList();
  }

  Future<void> insertProject(Project project) async {
    return isar.writeTxnSync(
      () => isar
          .collection<ProjectDto>()
          .putSync(ProjectDto.fromDomainModel(project)),
    );
  }

  Future<void> deleteProject(int id, {required bool deleteTasks}) async {
    if (deleteTasks) {
      await isar.writeTxnSync(() async {
        isar
            .collection<TaskDto>()
            .filter()
            .project((q) => q.idEqualTo(id))
            .build()
            .deleteAllSync();
        isar.collection<ProjectDto>().deleteSync(id);
      });
    } else {
      isar.writeTxnSync(() => isar.collection<ProjectDto>().deleteSync(id));
    }
  }

  //update project
  Future<void> updateProject(Project project) async {
    return isar.writeTxnSync(
      () => isar
          .collection<ProjectDto>()
          .putSync(ProjectDto.fromDomainModel(project)),
    );
  }
}
