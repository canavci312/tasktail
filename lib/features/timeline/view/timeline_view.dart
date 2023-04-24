import 'package:auto_route/auto_route.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:task_app/domain/repositories/models/task.dart';

import 'package:task_app/features/timeline/timeline.dart';
import 'package:task_app/features/widgets/expandable_fab.dart';
import 'package:task_app/navigation/router.dart';
import 'package:timelines/timelines.dart';

class TimelineView extends StatelessWidget {
  const TimelineView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TimelineCubit>();
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: AppExpandableFab(),
      appBar: AppBar(
        title: const Text('Tasktail'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (BuildContext context, int index) {
          return TimelineDayTile(
            tasks: [
              Task(
                title: 'Task 1',
                description: 'Description 1',
                dueDate: DateTime.now(),
                isCompleted: true,
                createdOn: DateTime.now(),
              ),
              Task(
                title: 'Task 2',
                description: 'Description 2',
                dueDate: DateTime.now(),
                createdOn: DateTime.now(),
              ),
            ],
            date: DateTime.now().add(
              Duration(days: index),
            ),
          );
        },
      ),
    );
  }
}

class TimelineDayTile extends StatelessWidget {
  const TimelineDayTile({super.key, this.tasks, required this.date});
  final List<Task>? tasks;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('EEEE, MMMM d').format(date),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          if (date.isToday) ...[
            Text(
              'Today',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            tasks?.length.toString() ?? '0',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'To Do',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            tasks?.length.toString() ?? '0',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Overdue',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            tasks?.length.toString() ?? '0',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            'Unplanned',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
          if (tasks != null && tasks!.isNotEmpty)
            Flexible(
              child: FixedTimeline.tileBuilder(
                builder: TimelineTileBuilder.connected(
                  indicatorBuilder: (context, index) {
                    if (index == tasks?.length) {
                      return OutlinedDotIndicator(
                        color: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      );
                    }
                    if (tasks![index].isCompleted) {
                      return DotIndicator(
                        color: Theme.of(context).primaryColor,
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 20,
                        color: Theme.of(context).primaryColor,
                      );
                    }
                  },
                  connectorBuilder: (context, index, type) {
                    return SolidLineConnector(
                      color: Theme.of(context).primaryColor,
                    );
                  },
                  nodePositionBuilder: (context, index) {
                    return 0;
                  },
                  contentsBuilder: (context, index) {
                    if (index == tasks?.length) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'Add Task',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      );
                    }
                    return TaskTile(task: tasks![index]);
                  },
                  itemCount: tasks!.length + 1,
                ),
              ),
            )
          else
            const AddTaskButton()
        ],
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.add_circle_outline_outlined),
        Text(
          'Add Task',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.task});
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title!),
      onTap: () => context.router.push(AddEditTaskRoute(task: task)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(task.description ?? ''),
          if (task.dueDate != null)
            Text(DateFormat('HH').format(task.dueDate!))
          else
            const SizedBox.shrink(),
        ],
      ),
    );
  }
}


enum Priority {
  noPriority,
  low,
  medium,
  high,
  urgent;

  Color? get color {
    switch (this) {
      case Priority.noPriority:
        return null;
      case Priority.low:
        return Colors.green;
      case Priority.medium:
        return Colors.yellow;
      case Priority.high:
        return Colors.orange;
      case Priority.urgent:
        return Colors.red;
    }
  }
}
