import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/project.dart';

import 'package:task_app/features/duplicate_project/duplicate_project.dart';
import 'package:task_app/features/duplicate_project/view/duplicate_project_view.dart';

class DuplicateProjectPage extends StatelessWidget {
  const DuplicateProjectPage({
    super.key,
  });
  static Future<Project?> show(BuildContext context, Project project) async {
    return showDialog<Project>(
      context: context,
      builder: (context) => BlocProvider(
        create: (context) => DuplicateProjectCubit(),
        child: DuplicateDialog(project: project),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
