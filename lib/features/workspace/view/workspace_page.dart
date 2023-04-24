import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/features/workspace/view/workspace_view.dart';
import 'package:task_app/features/workspace/workspace.dart';
@RoutePage() 
class WorkspacePage extends StatelessWidget {
  const WorkspacePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkspaceCubit(),
      child: const WorkspaceView(),
    );
  }
}
