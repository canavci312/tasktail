import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/workspace/workspace.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkspaceCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workspace'),
      ),
      body: BlocBuilder<WorkspaceCubit, WorkspaceState>(
        builder: (context, state) {
          return ListView(
            children: [
              ListTile(
                leading: const Icon(Icons.alarm_outlined),
                title: const Text('Reminders'),
                onTap: () async {},
              ),
              ListTile(
                leading: const Icon(Icons.edit_calendar_outlined),
                title: const Text('Import Calendar'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Switch.adaptive(
                      value: state.isCalendarImportOpen,
                      onChanged: (value) {
                        cubit.toggleCalendarImport();
                      },
                    ),
                    Icon(
                      Icons.info_outline,
                      color: Theme.of(context).colorScheme.outline,
                    ),
                  ],
                ),
              ),
              const ListTile(
                leading: Icon(Icons.note_outlined),
                title: Text('Notes'),
              ),
              const ListTile(
                leading: Icon(Icons.local_offer_outlined),
                title: Text('Tags'),
              ),
              const AboutListTile(
                icon: Icon(Icons.info_outline),
                applicationName: 'Tasktail',
                applicationVersion: '1.0.0',
                applicationLegalese: '© 2023',
                aboutBoxChildren: [
                  SizedBox(height: 24),
                  Text(
                    'Tasktail is a simple and modern task management app that allows you to create and manage tasks.',
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
