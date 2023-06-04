part of 'note_list_cubit.dart';

@freezed
class NoteListState  with _$NoteListState {
  const factory NoteListState( {
    required List<Task> notes,
  }) = _NoteListState;
}
