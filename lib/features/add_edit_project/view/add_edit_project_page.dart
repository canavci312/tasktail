import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/add_edit_project/add_edit_project.dart';
import 'package:task_app/features/add_edit_project/view/add_edit_project_view.dart';
import 'package:task_app/locator.dart';

class AddEditProjectPage extends StatelessWidget {
  const AddEditProjectPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddEditProjectCubit(getIt()),
      child: const AddEditProjectView(),
    );
  }
}
