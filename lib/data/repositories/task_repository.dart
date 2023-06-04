import 'dart:async';

import 'package:dart_date/dart_date.dart';
import 'package:isar/isar.dart';
import 'package:task_app/data/awesome_notification_service.dart';
import 'package:task_app/data/device_calendar.dart';
import 'package:task_app/data/isar/models/project_dto.dart';
import 'package:task_app/data/isar/models/tag_dto.dart';
import 'package:task_app/data/isar/models/task_dto.dart';
import 'package:task_app/data/repositories/settings_repository.dart';
import 'package:task_app/domain/repositories/models/task.dart';

class TaskRepository {
  TaskRepository({
    required this.awesomeNotificationService,
    required this.localProvider,
    required this.deviceCalendarService,
    required this.settingsRepository,
  }) {
    listenForReminders();
    listenCalendar();
    listenNotificationEvents();
  }
  final AwesomeNotificationService awesomeNotificationService;
  final Isar localProvider;
  final DeviceCalendarService deviceCalendarService;
  final SettingsRepository settingsRepository;
  Timer? calendarSubsTimer;
  void listenCalendar() {
    settingsRepository.isCalendarImportOpen.listen((value) {
      if (value) {
        subscribeCalendar();
      } else {
        unsubscribeCalendar();
      }
    });
  }

  void listenNotificationEvents() {
    awesomeNotificationService.taskCompletedStream.listen((event) async {
      final task = await getTaskById(event);
      await updateTask(task.copyWith(isCompleted: true));
    });
  }

  Stream<List<Task>> listenTasks() {
    return localProvider
        .collection<TaskDto>()
        .buildQuery<TaskDto>(
          sortBy: [const SortProperty(property: 'dueDate', sort: Sort.asc)],
        )
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  Stream<List<Task>> listenNotes() {
    return localProvider
        .collection<TaskDto>()
        .filter()
        .isNoteEqualTo(true)
        .sortByDueDateDesc()
        .build()
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  void dispose() {
    calendarSubsTimer?.cancel();
  }

  void unsubscribeCalendar() {
    calendarSubsTimer?.cancel();
  }

  void subscribeCalendar() {
    importTasksFromCalendar();
    calendarSubsTimer = Timer.periodic(
      const Duration(minutes: 5),
      (Timer t) => importTasksFromCalendar(),
    );
  }

  Future<void> importTasksFromCalendar() async {
    final tasks = await deviceCalendarService.getCalendarEvents();
    if (tasks != null) {
      for (final task in tasks) {
        final search = localProvider
            .collection<TaskDto>()
            .filter()
            .calendarIdEqualTo(task.calendarId)
            .build()
            .findFirstSync();
        if (search != null) {
          final domain = search.toDomainModel();
          await updateTask(domain.copyWith(dueDate: task.dueDate));
        } else {
          await insertTask(task);
        }
      }
    }
  }

  Stream<List<Task>> listenOverdueTasks() {
    return localProvider
        .collection<TaskDto>()
        .filter()
        .dueDateIsNotNull()
        .and()
        .dueDateLessThan(DateTime.now().setHour(23).setMinute(59).setSecond(59))
        .build()
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  Stream<List<Task>> listenUnplannedTasks() {
    return localProvider
        .collection<TaskDto>()
        .filter()
        .projectIsNull()
        .and()
        .dueDateIsNull()
        .build()
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  Stream<List<Task>> listenTasksByProjectId(int id) {
    return localProvider
        .collection<TaskDto>()
        .filter()
        .project((q) => q.idEqualTo(id))
        .watch(fireImmediately: true)
        .map((event) => event.map((e) => e.toDomainModel()).toList());
  }

  void listenForReminders() {
    localProvider
        .collection<TaskDto>()
        .buildQuery<TaskDto>(
          filter: const FilterGroup.and([
            FilterCondition.listLength(
              property: 'reminders',
              lower: 1,
              upper: 10,
            )
          ]),
        )
        .watch()
        .listen((event) async {
      if (await awesomeNotificationService.requestPermissions()) {
        awesomeNotificationService.cancelAll();
        for (final element in event) {
          awesomeNotificationService.createReminder(
            element.toDomainModel(),
          );
        }
      }
    });
  }

  List<Task> getTasksByProjectId(int id) {
    return localProvider
        .collection<TaskDto>()
        .filter()
        .project((q) => q.idEqualTo(id))
        .findAllSync()
        .map((e) => e.toDomainModel())
        .toList();
  }

  List<TaskDto> getTasks() {
    return localProvider
        .collection<TaskDto>()
        .buildQuery<TaskDto>()
        .findAllSync();
  }

  Future<void> insertTask(Task task) async {
    await localProvider.writeTxn<TaskDto>(
      () async {
        final taskDto = TaskDto.fromDomainModel(task);
        await localProvider.collection<TaskDto>().put(
              taskDto,
            );
        await taskDto.tags.reset();
        taskDto.tags
            .addAll(task.tags?.map((e) => TagDto.fromDomainModel(e)) ?? []);
        await taskDto.tags.save();
        await taskDto.project.reset();
        taskDto.project.value = task.project != null
            ? ProjectDto.fromDomainModel(task.project!)
            : null;
        await taskDto.project.save();
        return taskDto;
      },
    );
  }

  Future<void> updateTask(Task task) async {
    await localProvider.writeTxn<TaskDto>(
      () async {
        final taskDto = TaskDto.fromDomainModel(task);
        await localProvider.collection<TaskDto>().put(
              taskDto,
            );
        await taskDto.tags.reset();
        taskDto.tags
            .addAll(task.tags?.map((e) => TagDto.fromDomainModel(e)) ?? []);
        await taskDto.tags.save();
        await taskDto.project.reset();
        taskDto.project.value = task.project != null
            ? ProjectDto.fromDomainModel(task.project!)
            : null;
        await taskDto.project.save();
        return taskDto;
      },
    );
  }

  Future<Task> getTaskById(int id) async {
    final task = await localProvider.collection<TaskDto>().get(id);
    return task!.toDomainModel();
  }

  Future<bool> deleteTask(int id) async {
    return localProvider.writeTxnSync(
      () => localProvider.collection<TaskDto>().deleteSync(id),
    );
  }

  Future<void> deleteCalendarTasks() async {
    await localProvider.writeTxn(
      () => localProvider
          .collection<TaskDto>()
          .filter()
          .fromCalendarEqualTo(true)
          .build()
          .deleteAll(),
    );
  }
}
