import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/note_list/note_list.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';
import 'package:task_app/navigation/router.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NoteListCubit>();
    return BlocBuilder<NoteListCubit, NoteListState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.router
                  .push(AddEditTaskRoute(task: const Task(isNote: true)));
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            title: const Text('Notes'),
          ),
          body: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.surfaceVariant,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onChanged: cubit.searchNotes,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: state.notes.length,
                  itemBuilder: (context, index) {
                    final notes = state.notes[index];
                    return TaskTile(
                      task: notes,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
