part of 'select_tag_cubit.dart';

@freezed
class SelectTagState  with _$SelectTagState {
  const factory SelectTagState({
    required List<Tag> tags,
    required List<Tag> selectedTags,
  }) = _SelectTagState;
}
