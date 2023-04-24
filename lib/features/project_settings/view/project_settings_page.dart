import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/features/project_settings/project_settings.dart';
import 'package:task_app/features/project_settings/view/project_settings_view.dart';
import 'package:task_app/locator.dart';

@RoutePage()
class ProjectSettingsPage extends StatelessWidget {
  const ProjectSettingsPage(
    this.project, {
    super.key,
  });
  final Project project;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProjectSettingsCubit(getIt(), project),
      child: const ProjectSettingsView(),
    );
  }
}
