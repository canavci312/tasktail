import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/project.dart';

import 'package:task_app/features/unplanned/unplanned.dart';
import 'package:task_app/features/widgets/checkbox_task_tile.dart';

class UnplannedView extends StatelessWidget {
  const UnplannedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UnplannedCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Unplanned Tasks'),
      ),
      body: BlocBuilder<UnplannedCubit, UnplannedState>(
        builder: (context, state) {
          return state.tasks.isEmpty
              ? const Center(
                  child: Text('Great! No unplanned tasks.'),
                )
              : ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) {
                    final task = state.tasks[index];
                    return UnplannedCheckboxTaskTile(
                      onChanged: () {},
                      task: task,
                      onProjectChanged: (Project project) {
                        cubit.assignToProject(task, project);
                      },
                      onReschedule: (DateTime date) {
                        cubit.reschedule(task, date);
                      },
                    );
                  },
                );
        },
      ),
    );
  }
}
