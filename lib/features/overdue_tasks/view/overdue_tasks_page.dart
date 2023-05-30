import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/overdue_tasks/overdue_tasks.dart';
import 'package:task_app/features/overdue_tasks/view/overdue_tasks_view.dart';
import 'package:task_app/locator.dart';

@RoutePage()
class OverdueTasksPage extends StatelessWidget {
  const OverdueTasksPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OverdueTasksCubit(getIt())..listenTasks(),
      child: const OverdueTasksView(),
    );
  }
}
