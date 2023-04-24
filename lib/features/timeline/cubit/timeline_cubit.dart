import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timeline_state.dart';
part 'timeline_cubit.freezed.dart';

class TimelineCubit extends Cubit<TimelineState> {
    TimelineCubit(): super(const TimelineState());
}
