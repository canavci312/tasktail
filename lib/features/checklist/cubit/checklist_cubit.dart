import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/domain/repositories/models/checklist_item.dart';
import 'package:task_app/utils/extensions/list_extensions.dart';

part 'checklist_state.dart';
part 'checklist_cubit.freezed.dart';

class ChecklistCubit extends Cubit<ChecklistState> {
  ChecklistCubit(this.items) : super(ChecklistState(items: items));
  final List<CheckListItem> items;

  void reorderItems(int oldIndex, int newIndex) {
    final newItems = [...state.items]..reOrder(oldIndex, newIndex);
    emit(ChecklistState(items: newItems));
  }
}
