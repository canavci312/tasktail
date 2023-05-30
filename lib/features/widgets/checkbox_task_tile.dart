import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:flutter/material.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/select_project/view/select_project_page.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';
import 'package:task_app/features/widgets/reschedule_sheet.dart';
import 'package:task_app/navigation/router.dart';

class UnplannedCheckboxTaskTile extends StatelessWidget {
  const UnplannedCheckboxTaskTile({
    required this.onChanged,
    required this.task,
    required this.onProjectChanged,
    required this.onReschedule,
    super.key,
  });

  final VoidCallback onChanged;
  final Task task;
  final void Function(Project project) onProjectChanged;
  final void Function(DateTime date) onReschedule;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final result = await SelectProjectPage.show(context);
          if (result != null) {
            onProjectChanged.call(result);
            return true;
          }
        } else if (direction == DismissDirection.endToStart) {
          final result = await ReScheduleSheet.show(context);
          if (result != null) {
            onReschedule.call(result);
            return true;
          }
        }
        return false;
      },
      key: ValueKey(task.id),
      background: ColoredBox(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.grid_view_outlined,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Move to Board',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      secondaryBackground: ColoredBox(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit_calendar_outlined,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Reschedule',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      child: BaseCheckboxTaskTile(task: task, onChanged: onChanged),
    );
  }
}

class OverdueTaskTile extends StatelessWidget {
  const OverdueTaskTile({
    required this.task,
    required this.onChanged,
    required this.onDeleted,
    required this.onReschedule,
    required this.onSelected,
    required this.onSelectionModeActivated,
    this.isSelectionMode = false,
    this.selected = false,
    super.key,
  });

  final Task task;
  final bool selected;
  final bool isSelectionMode;
  final VoidCallback onChanged;
  final VoidCallback onDeleted;
  final VoidCallback onSelectionModeActivated;
  final VoidCallback onSelected;
  final void Function(DateTime date) onReschedule;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final result = await ReScheduleSheet.show(context);
          if (result != null) {
            onReschedule.call(result);
            return true;
          }
        }
        if (direction == DismissDirection.endToStart) {
          return true;
        }
        return false;
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          onDeleted.call();
        }
      },
      key: ValueKey(task.id),
      background: ColoredBox(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Row(
          children: [
            const SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit_calendar_outlined,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Reschedule',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      secondaryBackground: ColoredBox(
        color: Theme.of(context).colorScheme.secondaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete_outline_outlined,
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Delete',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
      ),
      child: BaseCheckboxTaskTile(
        task: task,
        onChanged: onChanged,
        selected: selected,
        isSelectionMode: isSelectionMode,
        onSelected: onSelected,
        onSelectionModeActivated: onSelectionModeActivated,
      ),
    );
  }
}

class BaseCheckboxTaskTile extends StatelessWidget {
  const BaseCheckboxTaskTile({
    required this.task,
    required this.onChanged,
    this.onSelected,
    this.selected = false,
    this.isSelectionMode = false,
    super.key,
    this.onSelectionModeActivated,
  });
  final VoidCallback? onSelected;
  final bool isSelectionMode;
  final Task task;
  final bool selected;
  final VoidCallback onChanged;
  final VoidCallback? onSelectionModeActivated;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        if (!isSelectionMode) {
          onSelectionModeActivated?.call();
          onSelected?.call();
        }
      },
      onTap: () => !isSelectionMode
          ? context.router.push(
              AddEditTaskRoute(
                task: task,
              ),
            )
          : null,
      child: ListTile(
        selected: selected,
        selectedTileColor: Theme.of(context).colorScheme.secondaryContainer,
        onTap: isSelectionMode
            ? () {
                onSelected?.call();
              }
            : null,
        trailing: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            onChanged.call();
          },
        ),
        title: Text(
          task.title!,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: task.description != null,
              child: Row(
                children: [
                  const Icon(
                    Icons.description_outlined,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    task.description ?? '',
                  ),
                ],
              ),
            ),
            Wrap(
              children: [
                Visibility(
                  visible: task.dueDate != null,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          CalendarTime(task.dueDate).toHuman,
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: task.priority != Priority.noPriority,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.flag,
                      size: 16,
                      color: task.priority.color,
                    ),
                  ),
                ),
                Visibility(
                  visible: task.reminders.isNotEmpty,
                  child: const Icon(
                    Icons.alarm_outlined,
                    size: 16,
                  ),
                ),
                Visibility(
                  visible: task.checklist != null && task.checklist!.isNotEmpty,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.checklist_outlined,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        '${task.checklist?.where((element) {
                          return element.isCompleted;
                        }).length} / ${task.checklist?.length}',
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
