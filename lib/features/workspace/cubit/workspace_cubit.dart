import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_state.dart';
part 'workspace_cubit.freezed.dart';

class WorkspaceCubit extends Cubit<WorkspaceState> {
    WorkspaceCubit(): super(const WorkspaceState());
}
