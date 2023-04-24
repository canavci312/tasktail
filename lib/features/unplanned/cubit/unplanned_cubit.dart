import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'unplanned_state.dart';
part 'unplanned_cubit.freezed.dart';

class UnplannedCubit extends Cubit<UnplannedState> {
    UnplannedCubit(): super(const UnplannedState());
}
