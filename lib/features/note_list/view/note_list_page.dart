import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:task_app/features/note_list/note_list.dart';
import 'package:task_app/features/note_list/view/note_list_view.dart';
import 'package:task_app/locator.dart';

@RoutePage()
class NoteListPage extends StatelessWidget {
  const NoteListPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteListCubit(getIt())..listenNotes(),
      child: const NoteListView(),
    );
  }
}
