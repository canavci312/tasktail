import 'package:calendar_time/calendar_time.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grouped_list/grouped_list.dart';

import 'package:task_app/features/overdue_tasks/overdue_tasks.dart';
import 'package:task_app/features/select_project/view/select_project_page.dart';
import 'package:task_app/features/widgets/checkbox_task_tile.dart';
import 'package:task_app/features/widgets/reschedule_sheet.dart';

class OverdueTasksView extends StatelessWidget {
  const OverdueTasksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OverdueTasksCubit>();
    return BlocBuilder<OverdueTasksCubit, OverdueTasksState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
            visible: state.isSelectionMode,
            child: Card(
              elevation: 5,
              color: Theme.of(context).colorScheme.tertiaryContainer,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      cubit.selectAllTasks();
                    },
                    child: Text(
                      'Select all',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onTertiaryContainer,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final date = await ReScheduleSheet.show(context);
                      if (date != null) {
                        cubit.rescheduleSelectedTasks(date);
                      }
                    },
                    icon: const Icon(Icons.edit_calendar_outlined),
                  ),
                  IconButton(
                    onPressed: () async {
                      final project = await SelectProjectPage.show(context);
                      if (project != null) {
                        cubit.moveSelectedTasks(project);
                      }
                    },
                    icon: const Icon(Icons.change_circle_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      cubit.deleteSelectedTasks();
                    },
                    icon: const Icon(Icons.delete_outline_outlined),
                  ),
                ],
              ),
            ),
          ),
          appBar: state.isSelectionMode
              ? AppBar(
                  title: Text('${state.selectedTasks.length} selected'),
                  leading: IconButton(
                    onPressed: () {
                      cubit.toggleSelectionMode();
                    },
                    icon: const Icon(Icons.close),
                  ),
                )
              : AppBar(
                  title: const Text('Overdue Tasks'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        cubit.toggleSelectionMode();
                      },
                      child: const Text('Select'),
                    )
                  ],
                ),
          body: state.tasks.isEmpty
              ? const Center(
                  child: Text('Great! No overdue tasks.'),
                )
              : GroupedListView(
                  elements: state.tasks,
                  groupBy: (task) => task.dueDate!.getDayOfYear,
                  groupHeaderBuilder: (element) {
                    return ColoredBox(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Text(
                          CalendarTime(element.dueDate)
                              .format('EEE, MMM d, ' 'yyyy'),
                        ),
                      ),
                    );
                  },
                  separator: const Divider(),
                  itemBuilder: (context, task) {
                    return OverdueTaskTile(
                      task: task,
                      onChanged: () {
                        cubit.toggleTask(task);
                      },
                      onDeleted: () {
                        cubit.deleteTask(task);
                      },
                      onReschedule: (DateTime date) {
                        cubit.reschedule(task, date);
                      },
                      isSelectionMode: state.isSelectionMode,
                      selected: state.selectedTasks.contains(task),
                      onSelected: () {
                        cubit.selectedTask(task);
                      },
                      onSelectionModeActivated: () {
                        cubit.toggleSelectionMode();
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
