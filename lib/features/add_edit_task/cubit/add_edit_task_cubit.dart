import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_app/data/repositories/task_repository.dart';
import 'package:task_app/domain/repositories/models/checklist_item.dart';
import 'package:task_app/domain/repositories/models/project.dart';
import 'package:task_app/domain/repositories/models/tag.dart';
import 'package:task_app/domain/repositories/models/task.dart';
import 'package:task_app/features/timeline/view/timeline_view.dart';

part 'add_edit_task_state.dart';
part 'add_edit_task_cubit.freezed.dart';

class AddEditTaskCubit extends Cubit<AddEditTaskState> {
  AddEditTaskCubit(this.task, this._taskRepository)
      : super(
          AddEditTaskState(
            checkListItems: task?.checklist ?? [],
            description: task?.description,
            dueDate: task?.dueDate,
            priority: task?.priority,
            project: task?.project,
            tags: task?.tags,
            title: task?.title,
          ),
        );
  final TaskRepository _taskRepository;
  final Task? task;
  void priorityChanged(Priority value) {
    emit(state.copyWith(priority: value));
  }

  void titleChanged(String title) {
    emit(state.copyWith(title: title));
  }

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void tagsChanged(List<Tag> tags) {
    emit(state.copyWith(tags: tags));
  }

  void checkListTaskAdded(CheckListItem item) {
    final items = state.checkListItems;
    emit(
      state.copyWith(
        checkListItems: [
          ...items,
          ...[item]
        ],
      ),
    );
  }

  void dueDateChanged(DateTime dueDate) {
    emit(state.copyWith(dueDate: dueDate));
  }

  void dueTimeChanged(TimeOfDay result) {
    final dueDate = state.dueDate;
    if (dueDate != null) {
      final newDueDate = DateTime(
        dueDate.year,
        dueDate.month,
        dueDate.day,
        result.hour,
        result.minute,
      );
      emit(state.copyWith(dueDate: newDueDate));
    }
  }

  void checkListChanged(List<CheckListItem> items) {
    emit(state.copyWith(checkListItems: items));
  }

  void projectSelected(Project? project) {
    emit(state.copyWith(project: project));
  }

  void saveTask() {
    final newTask = Task(
      id: task?.id,
      title: state.title,
      description: state.description,
      dueDate: state.dueDate,
      priority: state.priority ?? Priority.noPriority,
      project: state.project,
      tags: state.tags,
      checklist: state.checkListItems,
    );
    _taskRepository.insertTask(newTask);
  }
}
