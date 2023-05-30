import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/checklist_item.dart';
import 'package:task_app/domain/repositories/models/reminder.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/add_edit_task/add_edit_task.dart';
import 'package:task_app/features/add_edit_task/view/widgets/task_property_set_tile.dart';
import 'package:task_app/features/checklist/view/checklist_page.dart';
import 'package:task_app/features/select_project/view/select_project_page.dart';
import 'package:task_app/features/tags/select_tag/select_tag.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';
import 'package:task_app/locator.dart';
import 'package:task_app/navigation/router.dart';
import 'package:task_app/utils/extensions/string_extensions.dart';

class AddEditTaskView extends StatefulWidget {
  const AddEditTaskView({
    required this.task,
    super.key,
  });
  final Task? task;

  @override
  State<AddEditTaskView> createState() => _AddEditTaskViewState();
}

class _AddEditTaskViewState extends State<AddEditTaskView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.task != null) {
      titleController.text = widget.task?.title ?? '';
      descriptionController.text = widget.task?.description ?? '';
    }
  }

  String getTitle() {
    // ignore: use_if_null_to_convert_nulls_to_bools
    if (widget.task?.isNote == true) {
      if (widget.task?.title == null) {
        return 'Create Note';
      } else {
        return 'Edit Note';
      }
    }
    if (widget.task?.title == null) {
      return 'Create Task';
    } else {
      return 'Edit Task';
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddEditTaskCubit>();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          cubit.saveTask();
          ScaffoldMessenger.of(context).showSnackBar(
            cubit.state.dueDate == null && cubit.state.project == null
                ? SnackBar(
                    content: const Text(
                      'Task added to unplanned tasks',
                    ),
                    action: SnackBarAction(
                      label: 'View',
                      onPressed: () {
                        getIt<AppRouter>().navigate(
                          const UnplannedRoute(),
                        );
                      },
                    ),
                  )
                : SnackBar(
                    content: const Text(
                      'Task added to timeline',
                    ),
                    action: SnackBarAction(
                      label: 'View',
                      onPressed: () {
                        getIt<AppRouter>().navigate(
                          const TimelineRoute(),
                        );
                      },
                    ),
                  ),
          );

          context.router.pop();
        },
        label: const Text('Save'),
      ),
      appBar: AppBar(
        title: Text(getTitle()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            TextField(
              style: Theme.of(context).textTheme.titleLarge,
              controller: titleController,
              onChanged: cubit.titleChanged,
              decoration: InputDecoration(
                hintText: 'Title',
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
            TextField(
              controller: descriptionController,
              onChanged: cubit.descriptionChanged,
              style: Theme.of(context).textTheme.bodyMedium,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Would you like to add more details?',
                border: InputBorder.none,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
              ),
            ),
            const SelectProject(),
            const SelectDateTime(),
            const SetReminder(),
            const SelectPriority(),
            const TaskChecklist(),
            const AssignTags()
          ],
        ),
      ),
    );
  }
}

class SelectProject extends StatelessWidget {
  const SelectProject({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTaskCubit, AddEditTaskState>(
      builder: (context, state) {
        return TaskPropertySetTile(
          icon: Icons.ballot_outlined,
          content: state.project != null
              ? Row(
                  children: [
                    Chip(
                      label: Text(state.project!.title),
                      backgroundColor: state.project?.color.toColor(),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<AddEditTaskCubit>().projectSelected(null);
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ),
                    )
                  ],
                )
              : const Text('Select project'),
          onTap: () async {
            final result = await SelectProjectPage.show(context);
            if (result != null && context.mounted) {
              context.read<AddEditTaskCubit>().projectSelected(result);
            }
          },
        );
      },
    );
  }
}

class TaskChecklist extends StatelessWidget {
  const TaskChecklist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTaskCubit, AddEditTaskState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TaskPropertySetTile(
              icon: Icons.checklist_outlined,
              content: const Text('Checklist'),
              onTap: () async {
                final result = await showModalBottomSheet<String?>(
                  context: context,
                  builder: (context) => Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 12,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            autofocus: true,
                            decoration: const InputDecoration(
                              label: Text('Checklist item'),
                            ),
                            onFieldSubmitted: (value) {
                              Navigator.pop(context, value);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
                if (result != null && result.isNotEmpty) {
                  final item = CheckListItem(
                    title: result,
                    isCompleted: false,
                  );
                  if (context.mounted) {
                    context.read<AddEditTaskCubit>().checkListTaskAdded(item);
                  }
                }
              },
            ),
            Flexible(
              child: ChecklistPage(
                items: state.checkListItems,
                onListChanged: (items) {
                  context.read<AddEditTaskCubit>().checkListChanged(items);
                },
              ),
            )
          ],
        );
      },
    );
  }
}

class SetReminder extends StatelessWidget {
  const SetReminder({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTaskCubit, AddEditTaskState>(
      builder: (context, state) {
        return TaskPropertySetTile(
          icon: Icons.notification_add_outlined,
          content: state.reminders.isEmpty
              ? const Text('Add reminder')
              : Wrap(
                  children: [
                    for (final reminder in state.reminders)
                      Chip(
                        label: Text(
                          reminder.type.toString(),
                        ),
                      ),
                  ],
                ),
          onTap: () async {
            final result = await showModalBottomSheet<Reminder>(
              context: context,
              builder: (context) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Add reminder',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Visibility(
                      visible: state.dueDate != null,
                      child: ListTile(
                        title: Text(
                          'Scheduled time (${state.dueDate?.format('jm')})',
                        ),
                        onTap: () => Navigator.of(context).pop(
                          Reminder(
                            date: state.dueDate,
                            type: ReminderType.onTime,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state.dueDate != null,
                      child: ListTile(
                        title: Text(
                          '5 mins before (${state.dueDate?.format('jm')})',
                        ),
                        onTap: () => Navigator.of(context).pop(
                          Reminder(
                            date: state.dueDate,
                            type: ReminderType.fiveMinutes,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state.dueDate != null,
                      child: ListTile(
                        title: Text(
                          '10 mins before (${state.dueDate?.format('jm')})',
                        ),
                        onTap: () => Navigator.of(context).pop(
                          Reminder(
                            date: state.dueDate,
                            type: ReminderType.tenMinutes,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: state.dueDate != null,
                      child: ListTile(
                        title: Text(
                          '1 hour before (${state.dueDate?.format('jm')})',
                        ),
                        onTap: () => Navigator.of(context).pop(
                          Reminder(
                            date: state.dueDate,
                            type: ReminderType.oneHour,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.alarm_outlined),
                      title: const Text('At a specific time'),
                      onTap: () async {
                        final result = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (result != null && context.mounted) {
                          Navigator.of(context).pop(
                            Reminder(type: ReminderType.atSpecificTime),
                          );
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.alarm_add_outlined),
                      title: const Text('At a specific date and time'),
                      onTap: () async {
                        final result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                        if (result != null && context.mounted) {
                          Navigator.of(context).pop(
                            Reminder(
                              date: result,
                              type: ReminderType.atSpecificTimeAndDate,
                            ),
                          );
                        }
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.alarm_off_outlined),
                      title: const Text('No reminder'),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            );
            if (context.mounted) {
              context.read<AddEditTaskCubit>().reminderAdded(result);
            }
          },
        );
      },
    );
  }
}

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTaskCubit, AddEditTaskState>(
      builder: (context, state) {
        return BlocBuilder<AddEditTaskCubit, AddEditTaskState>(
          builder: (context, state) {
            return TaskPropertySetTile(
              icon: Icons.date_range_outlined,
              content: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      final result = await showDatePicker(
                        context: context,
                        initialDate: state.dueDate ?? DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                      );

                      if (result != null && context.mounted) {
                        context.read<AddEditTaskCubit>().dueDateChanged(result);
                      }
                    },
                    child: state.dueDate == null
                        ? const Chip(
                            label: Text('Date'),
                          )
                        : Chip(
                            label: Text(
                              CalendarTime(state.dueDate).toHumanArray.length ==
                                      1
                                  ? CalendarTime(state.dueDate).format(
                                      state.dueDate!.isThisYear
                                          ? 'EEE, MMM d'
                                          : 'EEE, MMM d, ' 'yy',
                                    )
                                  : CalendarTime(state.dueDate).toHumanArray[0],
                            ),
                          ),
                  ),
                  const SizedBox(width: 8),
                  Visibility(
                    visible: state.dueDate != null,
                    child: InkWell(
                      onTap: () async {
                        final result = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (result != null && context.mounted) {
                          context
                              .read<AddEditTaskCubit>()
                              .dueTimeChanged(result);
                        }
                      },
                      child: Chip(
                        label: Text(
                          CalendarTime(state.dueDate).toHumanArray.length == 1
                              ? CalendarTime(state.dueDate).format('h:mm a')
                              : CalendarTime(state.dueDate).toHumanArray[1],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: state.dueDate != null,
                    child: IconButton(
                      onPressed: () {
                        context.read<AddEditTaskCubit>().dueDateRemoved();
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class AssignTags extends StatelessWidget {
  const AssignTags({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTaskCubit, AddEditTaskState>(
      builder: (context, state) {
        return TaskPropertySetTile(
          icon: Icons.local_offer_outlined,
          content: state.tags != null && state.tags!.isNotEmpty
              ? SizedBox(
                  height: 40,
                  child: ListView.builder(
                    itemCount: state.tags!.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Chip(
                          label: Text(state.tags![index].name),
                          backgroundColor: state.tags![index].color.toColor(),
                        ),
                      );
                    },
                  ),
                )
              : const Text('Assign tags'),
          onTap: () async {
            final result = await showModalBottomSheet<List<Tag>>(
              context: context,
              builder: (context) => SelectTagPage(
                alreadySelected: state.tags,
              ),
            );
            if (result != null && context.mounted) {
              context.read<AddEditTaskCubit>().tagsChanged(result);
            }
          },
        );
      },
    );
  }
}

class SelectPriority extends StatelessWidget {
  const SelectPriority({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEditTaskCubit, AddEditTaskState>(
      builder: (context, state) {
        return TaskPropertySetTile(
          icon: Icons.flag_outlined,
          iconColor: state.priority?.color,
          content: Text(
            state.priority != Priority.noPriority
                ? '${state.priority?.name.capitalize()} priority'
                : 'Select priority',
            style: TextStyle(color: state.priority?.color),
          ),
          onTap: () async {
            final result = await showModalBottomSheet<Priority>(
              context: context,
              builder: (context) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select priority',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    for (final value in Priority.values)
                      if (value != Priority.noPriority)
                        ListTile(
                          leading: Icon(
                            Icons.flag_outlined,
                            color: value.color,
                          ),
                          title: Text(
                            value.name.capitalize(),
                            style: TextStyle(color: value.color),
                          ),
                          onTap: () {
                            Navigator.pop(context, value);
                          },
                        ),
                  ],
                ),
              ),
            );
            if (result != null && context.mounted) {
              context.read<AddEditTaskCubit>().priorityChanged(result);
            }
          },
        );
      },
    );
  }
}
