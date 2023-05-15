import 'package:auto_route/auto_route.dart';
import 'package:calendar_time/calendar_time.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:task_app/features/add_edit_project/view/add_edit_project_page.dart';

import 'package:task_app/features/board/board.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';
import 'package:task_app/features/widgets/expandable_fab.dart';
import 'package:task_app/navigation/router.dart';

class BoardView extends StatelessWidget {
  const BoardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    return BlocBuilder<BoardCubit, BoardState>(
      builder: (context, state) {
        final activeProjects = state.projects
            .where(
              (element) => !element.archived,
            )
            .toList();

        return Scaffold(
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: AppExpandableFab(selectedDate: DateTime.now()),
          appBar: AppBar(
            title: const Text('Board'),
            actions: [
              if (state.selectedProject != null)
                IconButton(
                  onPressed: () {
                    context.router.push(
                      ProjectSettingsRoute(project: state.selectedProject!),
                    );
                  },
                  icon: const Icon(Icons.settings_outlined),
                )
              else
                const SizedBox()
            ],
          ),
          body: activeProjects.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: Text('No projects'),
                    ),
                    FilledButton(
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (context) => const AddEditProjectPage(),
                        );
                      },
                      child: const Text('Create project'),
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: activeProjects.length + 1,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: FilterChip(
                                  label: const Row(
                                    children: [
                                      Icon(Icons.reorder_outlined),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('All'),
                                    ],
                                  ),
                                  showCheckmark: false,
                                  onSelected: (bool value) {
                                    cubit.changeSelectedProject(null);
                                  },
                                  selected: state.selectedProject == null,
                                ),
                              );
                            }
                            final item = activeProjects[index - 1];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: FilterChip(
                                label: Text(item.title),
                                backgroundColor: item.color.toColor(),
                                onSelected: (bool value) {
                                  cubit.changeSelectedProject(item);
                                },
                                selected: item == state.selectedProject,
                              ),
                            );
                          },
                        ),
                      ),
                      if (state.selectedProject == null)
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: ReorderableListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final item = activeProjects[index];
                                    return Card(
                                      key: UniqueKey(),
                                      child: ListTile(
                                        leading: const Icon(
                                          Icons.drag_handle_outlined,
                                        ),
                                        title: Text(item.title),
                                        trailing: Icon(
                                          Icons.circle,
                                          color: item.color.toColor(),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: activeProjects.length,
                                  onReorder: cubit.reorderProjects,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Divider(),
                              ),
                              Text(
                                'Archived projects',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Flexible(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: state.projects
                                      .where((element) => element.archived)
                                      .length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = state.projects
                                        .where((element) => element.archived)
                                        .toList()[index];
                                    return Card(
                                      child: ListTile(
                                        title: Text(item.title),
                                        trailing:
                                            const Icon(Icons.delete_outline),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      else
                        const SizedBox(),
                      if (state.selectedProject != null &&
                          state.tasks.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: LinearProgressIndicator(
                                  minHeight: 8,
                                  value: state.tasks.where((element) {
                                        return element.isCompleted;
                                      }).length /
                                      state.tasks.length,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              //calculate % completed

                              Text(
                                '${state.tasks.where((element) {
                                  return element.isCompleted;
                                }).length} / ${state.tasks.length}',
                              ),
                              const Icon(Icons.chevron_right_outlined)
                            ],
                          ),
                        ),
                        Flexible(
                          child: ListView.separated(
                            itemCount: state.tasks.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                indent: 12,
                                endIndent: 12,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              final task = state.tasks[index];
                              return CheckboxListTile(
                                checkboxShape: const CircleBorder(),
                                value: state.tasks[index].isCompleted,
                                onChanged: (bool? value) {
                                  cubit.toggleTask(
                                    task,
                                  );
                                },
                                selected: task.isCompleted,
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
                                            task.description!,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Wrap(
                                      children: [
                                        Visibility(
                                          visible: task.dueDate != null,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 4),
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
                                                  CalendarTime(task.dueDate)
                                                      .toHuman,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: task.priority !=
                                              Priority.noPriority,
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(right: 4),
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
                                          visible: task.checklist != null &&
                                              task.checklist!.isNotEmpty,
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
                              );
                            },
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
        );
      },
    );
  }
}
