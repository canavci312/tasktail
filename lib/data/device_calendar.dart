import 'package:dart_date/dart_date.dart';
import 'package:device_calendar/device_calendar.dart';
import 'package:task_app/domain/repositories/models/task.dart';

class DeviceCalendarService {
  late DeviceCalendarPlugin plugin;
  void init() {
    plugin = DeviceCalendarPlugin();
  }

  Future<List<Task>?> getCalendarEvents() async {
    await plugin.requestPermissions();
    final result = await plugin.retrieveCalendars();
    final calendar = result.data
        ?.firstWhere((element) => element.isDefault ?? false == true);
    if (calendar != null) {
      final events = await plugin.retrieveEvents(
        calendar.id,
        RetrieveEventsParams(
          startDate: DateTime.now().setHour(0).setMinute(0),
          endDate: DateTime.now().add(
            const Duration(days: 30),
          ),
        ),
      );
      final result = <Task>[];
      events.data?.forEach((element) {
        result.add(
          Task(
            title: element.title,
            dueDate: element.start,
            description: element.description,
            calendarId: element.eventId,
            fromCalendar: true,
          ),
        );
      });
      return result;
    }
    return null;
  }
}
