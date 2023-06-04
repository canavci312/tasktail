import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/tag_repository.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

part 'tag_list_state.dart';
part 'tag_list_cubit.freezed.dart';

class TagListCubit extends Cubit<TagListState> {
  TagListCubit(this.tagRepository) : super(const TagListState(tags: []));
  final TagRepository tagRepository;
  List<Tag> tags = [];
  StreamSubscription<List<Tag>>? subs;
  void listenTags() {
    subs = tagRepository.listenTags().listen((event) {
      tags = event;
      emit(state.copyWith(tags: event));
    });
  }

  @override
  Future<void> close() {
    subs?.cancel();
    return super.close();
  }

  void searchTags(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(tags: tags));
      return;
    } else {
      emit(
        state.copyWith(
          tags: state.tags
              .where((element) => element.name.contains(query))
              .toList(),
        ),
      );
    }
  }
}
