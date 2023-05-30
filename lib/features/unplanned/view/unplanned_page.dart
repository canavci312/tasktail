import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/unplanned/unplanned.dart';
import 'package:task_app/features/unplanned/view/unplanned_view.dart';
import 'package:task_app/locator.dart';
@RoutePage() 
class UnplannedPage extends StatelessWidget {
  const UnplannedPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UnplannedCubit(getIt())..listenUnplannedTasks(),
      child: const UnplannedView(),
    );
  }
}
