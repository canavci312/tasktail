import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/add_edit_project/add_edit_project.dart';

import 'package:task_app/features/select_project/select_project.dart';

class SelectProjectView extends StatelessWidget {
  const SelectProjectView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SelectProjectCubit>();
    return BlocBuilder<SelectProjectCubit, SelectProjectState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 4,
                  width: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              Text(
                'Select Projects',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              if (state.projects.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: state.projects.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = state.projects[index];
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () =>
                              context.router.pop(state.projects[index]),
                          child: Card(
                            color: Theme.of(context).colorScheme.surfaceVariant,
                            child: ListTile(
                              title: Text(item.title),
                              trailing: Icon(
                                Icons.circle,
                                color: item.color.toColor(),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              else
                const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('You have not created any projects yet!'),
                ),
              Center(
                child: FilledButton(
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (context) => const AddEditProjectPage(),
                  ),
                  child: const Text('Create Project'),
                ),
              ),
              const SizedBox(
                height: 24,
              )
            ],
          ),
        );
      },
    );
  }
}
