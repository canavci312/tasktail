import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/timeline/timeline.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';
import 'package:task_app/locator.dart';

@RoutePage()
class TimelinePage extends StatelessWidget {
  const TimelinePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimelineCubit(getIt())..listenTasks(),
      child: const TimelineView(),
    );
  }
}
