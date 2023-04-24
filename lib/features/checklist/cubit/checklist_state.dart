part of 'checklist_cubit.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChecklistState with _$ChecklistState {
  const factory ChecklistState({required List<CheckListItem> items}) =
      _ChecklistState;
}
