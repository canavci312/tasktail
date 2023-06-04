import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:task_app/domain/repositories/models/reminder.dart';
import 'package:task_app/domain/repositories/models/task.dart';

class AwesomeNotificationService {
  AwesomeNotificationService() {
    init();
    setListeners();
  }
  Future<bool> requestPermissions() async {
    if (await AwesomeNotifications().isNotificationAllowed()) {
      return true;
    }
    return AwesomeNotifications().requestPermissionToSendNotifications();
  }

  Future<void> pinTask(Task task) async {
    if (await requestPermissions()) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: task.id!,
          channelKey: 'reminder_channel',
          title: '${task.title}',
          body: '${task.description}',
          badge: 0,
          locked: true,
        ),
        actionButtons: [
          NotificationActionButton(key: 'dismiss', label: 'Dismiss'),
          NotificationActionButton(
            key: 'complete',
            label: 'Mark as complete',
          )
        ],
      );
    } else {
      throw Exception('Permission not granted');
    }
  }

  Future<void> init() async {
    await AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
          channelGroupKey: 'reminder_channel_group',
          channelKey: 'reminder_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel task reminder',
          defaultColor: const Color(0xFF9D50DD),
          ledColor: Colors.white,
        )
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'reminder_channel_group',
          channelGroupName: 'Task Alerts',
        )
      ],
      debug: true,
    );
  }

  void setListeners() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
    );
  }

  Future<bool> hasPermission() async {
    final result = await AwesomeNotifications().isNotificationAllowed();
    if (result) {
      return true;
    } else {
      return await AwesomeNotifications()
          .requestPermissionToSendNotifications();
    }
  }

  void cancelAll() {
    AwesomeNotifications().cancelAllSchedules();
  }

  void createReminder(Task task) {
    for (final element in task.reminders) {
      late NotificationCalendar calendar;
      switch (element.type) {
        case ReminderType.atSpecificTime:
          calendar = NotificationCalendar(
            hour: element.date!.hour,
            minute: element.date!.minute,
            second: element.date!.second,
            year: element.date!.year,
            month: element.date!.month,
            day: element.date!.day,
          );
        case ReminderType.atSpecificTimeAndDate:
          calendar = NotificationCalendar(
            hour: element.date!.hour,
            minute: element.date!.minute,
            second: element.date!.second,
            year: element.date!.year,
            month: element.date!.month,
            day: element.date!.day,
          );
        case ReminderType.onTime:
          calendar = NotificationCalendar(
            hour: task.dueDate!.hour,
            minute: task.dueDate!.minute,
            second: task.dueDate!.second,
            year: task.dueDate!.year,
            month: task.dueDate!.month,
          );
        case ReminderType.fiveMinutes:
          final remindDate = task.dueDate!.subtract(const Duration(minutes: 5));
          calendar = NotificationCalendar(
            hour: remindDate.hour,
            minute: remindDate.minute,
            second: remindDate.second,
            year: remindDate.year,
            month: remindDate.month,
          );
        case ReminderType.tenMinutes:
          final remindDate =
              task.dueDate!.subtract(const Duration(minutes: 10));
          calendar = NotificationCalendar(
            hour: remindDate.hour,
            minute: remindDate.minute,
            second: remindDate.second,
            year: remindDate.year,
            month: remindDate.month,
          );
        case ReminderType.oneHour:
          final remindDate = task.dueDate!.subtract(const Duration(hours: 1));
          calendar = NotificationCalendar(
            hour: remindDate.hour,
            minute: remindDate.minute,
            second: remindDate.second,
            year: remindDate.year,
            month: remindDate.month,
          );
      }
      AwesomeNotifications().createNotification(
        schedule: calendar,
        content: NotificationContent(
          id: task.id!,
          channelKey: 'reminder_channel',
          wakeUpScreen: true,
          badge: 1,
          title: 'Upcoming event: ${task.title}',
          body: 'Simple body',
        ),
        actionButtons: [
          NotificationActionButton(key: 'dismiss', label: 'Dismiss'),
          NotificationActionButton(
            key: 'complete',
            label: 'Mark as complete',
          )
        ],
      );
    }
  }
}

class NotificationController {
  /// Use this method to detect when a new notification or a schedule is created
  @pragma('vm:entry-point')
  static Future<void> onNotificationCreatedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect every time that a new notification is displayed
  @pragma('vm:entry-point')
  static Future<void> onNotificationDisplayedMethod(
    ReceivedNotification receivedNotification,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect if the user dismissed a notification
  @pragma('vm:entry-point')
  static Future<void> onDismissActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Your code goes here
  }

  /// Use this method to detect when the user taps on a notification or action button
  @pragma('vm:entry-point')
  static Future<void> onActionReceivedMethod(
    ReceivedAction receivedAction,
  ) async {
    // Your code goes here

    // Navigate into pages, avoiding to open the notification details page over another details page already opened
    // MyApp.navigatorKey.currentState?.pushNamedAndRemoveUntil('/notification-page',
    //         (route) => (route.settings.name != '/notification-page') || route.isFirst,
    //     arguments: receivedAction);
  }
}
