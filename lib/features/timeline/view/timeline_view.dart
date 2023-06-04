import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:intl/intl.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/timeline/timeline.dart';
import 'package:task_app/features/widgets/expandable_fab.dart';
import 'package:task_app/navigation/router.dart';
import 'package:task_app/utils/date_utils.dart';
import 'package:timelines/timelines.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({
    super.key,
  });

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  final AutoScrollController controller = AutoScrollController();
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TimelineCubit>();
    return BlocBuilder<TimelineCubit, TimelineState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasktail'),
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(cubit),
                  );
                },
                icon: const Icon(Icons.search_outlined),
              ),
              IconButton(
                onPressed: () {
                  cubit.toggleViewMode();
                },
                icon: const Icon(Icons.loop_outlined),
              )
            ],
          ),
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: AppExpandableFab(
            selectedDate: state.selectedDate,
          ),
          body: state.viewMode == ViewMode.timeline
              ? CustomScrollView(
                  controller: controller,
                  slivers: [
                    _calendarAppBar(state, context, cubit),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: AutoScrollTag(
                            key: ValueKey(index),
                            controller: controller,
                            index: index,
                            child: TimelineDayTile(
                              tasks: state.tasks.where((element) {
                                return element.dueDate != null &&
                                    element.dueDate!.isSameDay(
                                      DateTime.now().add(
                                        Duration(days: index),
                                      ),
                                    );
                              }).toList(),
                              date: DateTime.now().add(
                                Duration(days: index),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      _calendarAppBar(state, context, cubit),
                    ];
                  },
                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: PageView.builder(
                      controller: pageController,
                      onPageChanged: (value) => cubit.onDateSelected(
                        DateTime.now().add(
                          Duration(days: value),
                        ),
                      ),
                      itemBuilder: (context, index) {
                        return TimelineDayTile(
                          tasks: state.tasks.where((element) {
                            return element.dueDate != null &&
                                element.dueDate!.isSameDay(
                                  DateTime.now().add(
                                    Duration(days: index),
                                  ),
                                );
                          }).toList(),
                          date: DateTime.now().add(
                            Duration(days: index),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        );
      },
    );
  }

  SliverAppBar _calendarAppBar(
    TimelineState state,
    BuildContext context,
    TimelineCubit cubit,
  ) {
    return SliverAppBar(
      expandedHeight: state.timeLineFormat == CalendarFormat.week ? 150 : 400,
      snap: true,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: TableCalendar<DateTime>(
          currentDay: DateTime.now(),
          selectedDayPredicate: (day) => isSameDay(day, state.selectedDate),
          focusedDay: state.selectedDate,
          calendarStyle: CalendarStyle(
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            todayDecoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            todayTextStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          firstDay: DateTime(1990),
          lastDay: DateTime(2050),
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            CalendarFormat.week: 'Week'
          },
          calendarFormat: state.timeLineFormat,
          onDaySelected: (date, focusedDay) {
            cubit.onDateSelected(date);
            state.viewMode == ViewMode.timeline
                ? controller.scrollToIndex(
                    date.isSameDay(DateTime.now())
                        ? 0
                        : date.differenceInDays(DateTime.now()) + 1,
                    preferPosition: AutoScrollPosition.begin,
                  )
                : pageController.jumpToPage(
                    date.isSameDay(DateTime.now())
                        ? 0
                        : date.differenceInDays(DateTime.now()) + 1,
                  );
          },
          onFormatChanged: (format) {
            cubit.onFormatChanged(format);
          },
        ),
      ),
    );
  }
}

// ignore: strict_raw_type
class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate(this.cubit);
  final TimelineCubit cubit;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear_outlined),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    cubit.onSearch(query);
    return ListView.builder(
      itemCount: cubit.state.searchedTasks.length,
      itemBuilder: (context, index) {
        final task = cubit.state.searchedTasks[index];
        return ListTile(
          onTap: () {
            context.router.push(
              AddEditTaskRoute(task: task),
            );
          },
          title: Text(task.title!),
          subtitle: Text(task.description!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    cubit.onSearch(query);
    return ListView.builder(
      itemCount: cubit.state.searchedTasks.length,
      itemBuilder: (context, index) {
        final task = cubit.state.searchedTasks[index];
        return ListTile(
          onTap: () {
            context.router.push(
              AddEditTaskRoute(task: task),
            );
          },
          title: Text(task.title!),
          subtitle: task.description != null ? Text(task.description!) : null,
        );
      },
    );
  }
}

class TimelineDayTile extends StatelessWidget {
  const TimelineDayTile({
    required this.date,
    super.key,
    this.tasks,
  });
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
                            tasks == null
                                ? '0'
                                : tasks!.todaysTodoTasks.toString(),
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
                  child: InkWell(
                    onTap: () {
                      context.router.push(
                        const OverdueTasksRoute(),
                      );
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Text(
                              context
                                  .read<TimelineCubit>()
                                  .state
                                  .overdueCount
                                  .toString(),
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
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text(
                            tasks == null
                                ? '0'
                                : context
                                    .read<TimelineCubit>()
                                    .state
                                    .unplannedTasksCount
                                    .toString(),
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
                      return InkWell(
                        onTap: () => context.router.push(
                          AddEditTaskRoute(
                            task: Task(
                              dueDate: AppDateUtils.setAddTaskDate(date),
                            ),
                          ),
                        ),
                        child: OutlinedDotIndicator(
                          color: Theme.of(context).colorScheme.primary,
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    }
                    if (tasks![index].isNote) {
                      return InkWell(
                        onTap: () => context.router.push(
                          AddEditTaskRoute(
                            task: tasks![index],
                          ),
                        ),
                        child: ContainerIndicator(
                          size: 20,
                          child: Container(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      );
                    }
                    return InkWell(
                      onTap: () => context
                          .read<TimelineCubit>()
                          .toggleDone(tasks![index]),
                      child: tasks![index].isCompleted
                          ? DotIndicator(
                              color: Theme.of(context).colorScheme.primary,
                              child: Icon(
                                Icons.check,
                                color: Theme.of(context).colorScheme.onPrimary,
                                size: 20,
                              ),
                            )
                          : OutlinedDotIndicator(
                              size: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                    );
                  },
                  connectorBuilder: (context, index, type) {
                    return SolidLineConnector(
                      color: Theme.of(context).colorScheme.primary,
                    );
                  },
                  nodePositionBuilder: (context, index) {
                    return 0;
                  },
                  contentsBuilder: (context, index) {
                    if (index == tasks?.length) {
                      return InkWell(
                        onTap: () => context.router.push(
                          AddEditTaskRoute(
                            task: Task(
                              dueDate: AppDateUtils.setAddTaskDate(date),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Add Task',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
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
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AddTaskButton(
                date: date,
              ),
            )
        ],
      ),
    );
  }
}

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    required this.date,
    super.key,
  });
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(
        AddEditTaskRoute(
          task: Task(dueDate: AppDateUtils.setAddTaskDate(date)),
        ),
      ),
      child: Row(
        children: [
          const Icon(Icons.add_circle_outline_outlined),
          Text(
            'Add Task',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({
    required this.task,
    super.key,
  });
  final Task task;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title!),
      onTap: () => context.router.push(AddEditTaskRoute(task: task)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: task.description != null,
            child: Row(
              children: [
                Text(
                  task.description ?? '',
                ),
              ],
            ),
          ),
          Row(
            children: [
              Visibility(
                visible: task.dueDate != null,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        size: 16,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(CalendarTime(task.dueDate).format('h:mm a')),
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
              ),
              Visibility(
                visible: task.project != null,
                child: Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: 16,
                      color: task.project?.color.toColor(),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      task.project?.title ?? '',
                    ),
                  ],
                ),
              )
            ],
          ),
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
