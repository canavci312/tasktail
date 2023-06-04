import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/app/blocs/cubit/theme_cubit.dart';

import 'package:task_app/features/workspace/workspace.dart';
import 'package:task_app/navigation/router.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkspaceCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('More'),
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
                      onChanged: (value) async {
                        if (value) {
                          cubit.toggleCalendarImport(value, null);
                        } else {
                          final result = await showDialog<bool?>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Canceling Calendar Import'),
                              content: const Text(
                                'Do you want to keep the tasks created from the calendar?',
                              ),
                              actionsAlignment: MainAxisAlignment.end,
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, false),
                                  child: const Text('No'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: const Text('Yes'),
                                ),
                              ],
                            ),
                          );
                          if (result == null) {
                            return;
                          } else {
                            cubit.toggleCalendarImport(false, result);
                          }
                        }
                      },
                    ),
                    IconButton(
                      onPressed: () => showDialog<void>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Import Calendar'),
                          content: const Text(
                            'Takes the next 30 days from your calendar and creates tasks from them. Events are syncronised time to time.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                      icon: Icon(
                        Icons.info_outline,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.note_outlined),
                title: const Text('Notes'),
                onTap: () => context.router.push(const NoteListRoute()),
              ),
              ListTile(
                leading: const Icon(Icons.local_offer_outlined),
                title: const Text('Tags'),
                onTap: () => context.router.push(const TagListRoute()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Theme',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: const Text('Light'),
                            leading: Radio(
                              value: ThemeMode.light,
                              groupValue: context.read<ThemeCubit>().state,
                              onChanged: (value) {
                                if (value != null) {
                                  context
                                      .read<ThemeCubit>()
                                      .changeThemeMode(value);
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Dark'),
                            contentPadding: EdgeInsets.zero,
                            leading: Radio(
                              value: ThemeMode.dark,
                              groupValue: context.read<ThemeCubit>().state,
                              onChanged: (value) {
                                if (value != null) {
                                  context
                                      .read<ThemeCubit>()
                                      .changeThemeMode(value);
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('System'),
                            contentPadding: EdgeInsets.zero,
                            leading: Radio(
                              value: ThemeMode.system,
                              groupValue: context.read<ThemeCubit>().state,
                              onChanged: (value) {
                                if (value != null) {
                                  context
                                      .read<ThemeCubit>()
                                      .changeThemeMode(value);
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
