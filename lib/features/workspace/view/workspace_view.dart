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
            children: const [
              ListTile(
                leading: Icon(Icons.alarm_outlined),
                title: Text('Reminders'),
              ),
              ListTile(
                leading: Icon(Icons.edit_calendar_outlined),
                title: Text('Import Calendar'),
              ),
              ListTile(
                leading: Icon(Icons.note_outlined),
                title: Text('Notes'),
              ),
              ListTile(
                leading: Icon(Icons.local_offer_outlined),
                title: Text('Tags'),
              ),
              AboutListTile(
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
