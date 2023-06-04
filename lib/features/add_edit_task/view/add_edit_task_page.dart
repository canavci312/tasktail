import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/add_edit_task/add_edit_task.dart';
import 'package:task_app/features/add_edit_task/view/add_edit_task_view.dart';
import 'package:task_app/locator.dart';

@RoutePage()
class AddEditTaskPage extends StatelessWidget {
  const AddEditTaskPage({
    super.key,
    this.task,
  });

  final Task? task;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEditTaskCubit(task, getIt(),getIt()),
      child: AddEditTaskView(
        task: task,
      ),
    );
  }
}
