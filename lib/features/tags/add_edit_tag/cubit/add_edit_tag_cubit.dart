import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/tag_repository.dart';
import 'package:task_app/domain/repositories/models/tag.dart';

part 'add_edit_tag_state.dart';
part 'add_edit_tag_cubit.freezed.dart';

class AddEditTagCubit extends Cubit<AddEditTagState> {
  AddEditTagCubit(this.tag, this.tagRepository)
      : super(
          AddEditTagState(
            name: tag?.name,
            color: tag?.color ?? TagColor.noColor,
          ),
        );
  final TagRepository tagRepository;
  final Tag? tag;
  void changeName(String value) {
    emit(state.copyWith(name: value));
  }

  void changeColor(TagColor color) {
    emit(state.copyWith(color: color));
  }

  void saveTag() {
    tagRepository.insertTag(
      Tag(
        name: state.name!,
        color: state.color ?? TagColor.noColor,
      ),
    );
  }
}
