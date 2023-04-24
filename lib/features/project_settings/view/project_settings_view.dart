import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
import 'package:task_app/features/duplicate_project/view/duplicate_project_page.dart';

import 'package:task_app/features/project_settings/project_settings.dart';
import 'package:task_app/features/widgets/color_picker.dart';
import 'package:task_app/features/widgets/sort_by_picker.dart';

class ProjectSettingsView extends StatefulWidget {
  const ProjectSettingsView({
    super.key,
  });

  @override
  State<ProjectSettingsView> createState() => _ProjectSettingsViewState();
}

class _ProjectSettingsViewState extends State<ProjectSettingsView> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProjectSettingsCubit>();
    return BlocBuilder<ProjectSettingsCubit, ProjectSettingsState>(
      builder: (context, state) {
        controller.text = state.project.title;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Project Settings'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: [
                Row(
                  children: [
                    if (state.project.color != TagColor.noColor)
                      InkWell(
                        onTap: () => onColorPressed(context),
                        child: Icon(
                          Icons.circle,
                          color: state.project.color.toColor(),
                        ),
                      )
                    else
                      InkWell(
                        onTap: () => onColorPressed(context),
                        child: const Icon(
                          Icons.format_color_reset_outlined,
                        ),
                      ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        onSubmitted: cubit.changeName,
                        controller: controller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Project name',
                        ),
                      ),
                    ),
                  ],
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.sort_outlined),
                  title: Row(
                    children: [
                      const Text('Sort by: '),
                      Icon(state.project.sortyBy.icon),
                      Text(state.project.sortyBy.toText()),
                    ],
                  ),
                  onTap: () async {
                    final result = await SortByPicker.show(context);
                    if (result != null) {
                      cubit.changeSortby(result);
                    }
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.copy_all_outlined),
                  title: const Text('Select multiple items'),
                  onTap: () => cubit.archiveProject(),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.drive_file_move_outlined),
                  title: const Text('Move all items'),
                  onTap: () {
                    cubit.deleteProject();
                  },
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.copy_outlined),
                  title: const Text('Duplicate'),
                  onTap: () async {
                    final result =
                        await DuplicateProjectPage.show(context, state.project);
                    if (result != null) {
                      cubit.duplicateProject(result);
                    }
                  },
                ),
                Visibility(
                  visible: state.project.archived,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.unarchive_outlined),
                    title: const Text('Unarchive'),
                    onTap: () {
                      cubit.unArchive();
                    },
                  ),
                ),
                Visibility(
                  visible: !state.project.archived,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.archive_outlined),
                    title: const Text('Archive'),
                    onTap: () async {
                      final result = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Archive project'),
                          content: const Text(
                            'You will still be able to access items in this project and you can unarchive it later.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                cubit.archiveProject();
                                Navigator.pop(context, true);
                              },
                              child: const Text('Archive'),
                            ),
                          ],
                        ),
                      );
                      if (result ?? false == true) {
                        cubit.archiveProject();
                      }
                    },
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(
                    Icons.delete_outline_outlined,
                    color: Colors.red,
                  ),
                  title:
                      const Text('Delete', style: TextStyle(color: Colors.red)),
                  onTap: () async {
                    //TODO delete nasıl çalışıyor bakman lazım
                    final result = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete project'),
                        content: const Text(
                          'You will still be able to access items in this project and you can unarchive it later.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              cubit.archiveProject();
                              Navigator.pop(context, true);
                            },
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                    if (result ?? false == true) {
                      cubit.deleteProject();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> onColorPressed(BuildContext context) async {
    final result = await ColorPicker.show(context);
    if (result != null && context.mounted) {
      context.read<ProjectSettingsCubit>().changeColor(result);
    }
  }
}
