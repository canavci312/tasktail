import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/board/board.dart';
import 'package:task_app/features/board/view/board_view.dart';
import 'package:task_app/locator.dart';

@RoutePage()
class BoardPage extends StatelessWidget {
  const BoardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoardCubit(getIt(),getIt())..listenProjects(),
      child: const BoardView(),
    );
  }
}
