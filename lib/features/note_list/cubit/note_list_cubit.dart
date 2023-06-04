import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/repositories/models/task.dart';

part 'note_list_state.dart';
part 'note_list_cubit.freezed.dart';

class NoteListCubit extends Cubit<NoteListState> {
  NoteListCubit(this.taskRepository) : super(const NoteListState(notes: []));
  final TaskRepository taskRepository;
  StreamSubscription<List<Task>>? subs;
  List<Task> notes = [];
  void listenNotes() {
    subs = taskRepository.listenNotes().listen((event) {
      notes = event;
      emit(state.copyWith(notes: event));
    });
  }

  void searchNotes(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(notes: notes));
      return;
    } else {
      emit(
        state.copyWith(
          notes: state.notes.where((element) {
            return element.title != null
                ? element.title!.contains(query)
                // ignore: avoid_bool_literals_in_conditional_expressions
                : false || element.description != null
                    ? element.description!.contains(query)
                    : false;
          }).toList(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    subs?.cancel();
    return super.close();
  }
}
