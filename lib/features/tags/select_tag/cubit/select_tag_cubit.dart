import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/tag_repository.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

part 'select_tag_state.dart';
part 'select_tag_cubit.freezed.dart';

class SelectTagCubit extends Cubit<SelectTagState> {
  SelectTagCubit(this.tagRepository, this.alreadySelected)
      : super(
          SelectTagState(
            tags: [],
            selectedTags: alreadySelected ?? [],
          ),
        );
  final TagRepository tagRepository;
  final List<Tag>? alreadySelected;

  late StreamSubscription<List<Tag>> _tagSubscription;
  void listenTags() {
    _tagSubscription = tagRepository.listenTags().listen((event) {
      emit(
        state.copyWith(
          tags: event,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _tagSubscription.cancel();
    return super.close();
  }

  void selectTag(Tag tag) {
    emit(
      state.copyWith(
        selectedTags: [...state.selectedTags, tag],
      ),
    );
  }

  void unselectTag(Tag tag) {
    emit(
      state.copyWith(
        selectedTags: state.selectedTags
            .where((selectedTag) => selectedTag != tag)
            .toList(),
      ),
    );
  }
}
