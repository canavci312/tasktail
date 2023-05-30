import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/data/awesome_notification_service.dart';
import 'package:task_app/data/isar/models/project_dto.dart';
import 'package:task_app/data/isar/models/tag_dto.dart';
import 'package:task_app/data/isar/models/task_dto.dart';
import 'package:task_app/data/repositories/project_repository.dart';
import 'package:task_app/data/repositories/tag_repository.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/navigation/router.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  getIt.registerSingleton<AppRouter>(AppRouter());
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [TaskDtoSchema, ProjectDtoSchema, TagDtoSchema],
    directory: dir.path,
  );
  

  getIt
    ..registerSingleton<AwesomeNotificationService>(
      AwesomeNotificationService(),
    )
    ..registerSingleton<TaskRepository>(
      TaskRepository(
        localProvider: isar,
        awesomeNotificationService: getIt(),
      ),
    )
    ..registerSingleton<TagRepository>(
      TagRepository(
        isar: isar,
      ),
    )
    ..registerSingleton<ProjectRepository>(
      ProjectRepository(
        isar: isar,
      ),
    );
}
