import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/workspace/workspace.dart';

class WorkspaceView extends StatelessWidget {
  const WorkspaceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkspaceCubit>();
    return Container(
      
    );
  }
}
