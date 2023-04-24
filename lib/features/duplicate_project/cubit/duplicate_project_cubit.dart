import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'duplicate_project_state.dart';
part 'duplicate_project_cubit.freezed.dart';

class DuplicateProjectCubit extends Cubit<DuplicateProjectState> {
  DuplicateProjectCubit() : super(const DuplicateProjectState());
}
