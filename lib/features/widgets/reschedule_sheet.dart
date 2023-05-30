import 'package:calendar_time/calendar_time.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';

class ReScheduleSheet extends StatefulWidget {
  const ReScheduleSheet({super.key});
  static Future<DateTime?> show(BuildContext context) async {
    return showModalBottomSheet<DateTime>(
      context: context,
      showDragHandle: true,
      builder: (context) => const ReScheduleSheet(),
    );
  }

  @override
  State<ReScheduleSheet> createState() => _ReScheduleSheetState();
}

class _ReScheduleSheetState extends State<ReScheduleSheet> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            _selectedDate != null
                ? CalendarTime(_selectedDate).format('EEE, MMM d')
                : 'No date',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: const Text('Today'),
          onTap: () {
            setState(() {
              _selectedDate = DateTime.now();
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: const Text('Tomorrow'),
          onTap: () {
            setState(() {
              _selectedDate = DateTime.now().add(const Duration(days: 1));
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: const Text('Next Week'),
          onTap: () {
            setState(() {
              _selectedDate = DateTime.now().add(const Duration(days: 7));
            });
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: const Text('Custom'),
          onTap: () async {
            final result = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().addYears(5),
            );
            if (result != null) {
              setState(() {
                _selectedDate = result;
              });
            }
          },
        ),
        ListTile(
          leading: const Icon(Icons.calendar_today_outlined),
          title: const Text('No Date'),
          onTap: () {
            setState(() {
              _selectedDate = null;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop(_selectedDate);
                  },
                  child: const Text('Select'),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
