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
        return Scaffold(
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: AppExpandableFab(),
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
          body: state.projects.isEmpty
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
              : Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount: state.projects.length + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: FilterChip(
                                label: Row(
                                  children: const [
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
                          final item = state.projects[index - 1];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      Flexible(
                        child: ReorderableListView.builder(
                          itemBuilder: (context, index) {
                            final item = state.projects[index];
                            return Card(
                              key: UniqueKey(),
                              child: ListTile(
                                leading: const Icon(Icons.drag_handle_outlined),
                                title: Text(item.title),
                                trailing: Icon(
                                  Icons.circle,
                                  color: item.color.toColor(),
                                ),
                              ),
                            );
                          },
                          itemCount: state.projects.length,
                          onReorder: cubit.reorderProjects,
                        ),
                      )
                    else
                      const SizedBox(),
                    if (state.selectedProject != null &&
                        state.selectedProject!.tasks != null &&
                        state.selectedProject!.tasks!.isNotEmpty) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                minHeight: 8,
                                value: state.selectedProject!.tasks!
                                        .where((element) {
                                      return element.isCompleted;
                                    }).length /
                                    state.selectedProject!.tasks!.length,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            //calculate % completed

                            Text(
                              '${state.selectedProject!.tasks!.where((element) {
                                return element.isCompleted;
                              }).length} / ${state.selectedProject!.tasks!.length}',
                            ),
                            const Icon(Icons.chevron_right_outlined)
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.separated(
                          itemCount: state.selectedProject!.tasks!.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              indent: 12,
                              endIndent: 12,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            final task = state.selectedProject!.tasks![index];
                            return CheckboxListTile(
                              checkboxShape: const CircleBorder(),
                              value: state
                                  .selectedProject!.tasks![index].isCompleted,
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
        );
      },
    );
  }
}
