part of 'tag_list_cubit.dart';

@freezed
class TagListState with _$TagListState {
  const factory TagListState({
  required  List<Tag> tags,
  }) = _TagListState;
}
