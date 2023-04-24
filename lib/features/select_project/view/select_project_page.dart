import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/select_project/select_project.dart';
import 'package:task_app/features/select_project/view/select_project_view.dart';
import 'package:task_app/locator.dart';

class SelectProjectPage extends StatelessWidget {
  const SelectProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectProjectCubit(getIt())..listenProjects(),
      child: const SelectProjectView(),
    );
  }
}
