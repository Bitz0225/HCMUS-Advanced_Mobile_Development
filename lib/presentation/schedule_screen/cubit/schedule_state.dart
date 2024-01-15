import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class ScheduleState extends WidgetState {
  final BookedScheduleOutput? bookedScheduleOutput;
  final BookedScheduleRow? currentBookedSchedule;

  const ScheduleState({
    this.bookedScheduleOutput,
    this.currentBookedSchedule,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    bookedScheduleOutput,
    currentBookedSchedule,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bookedScheduleOutput': bookedScheduleOutput?.toJson(),
      'currentBookedSchedule': currentBookedSchedule?.toJson(),
    };
  }

  factory ScheduleState.fromJson(Map<String, dynamic> json) {
    return ScheduleState(
      bookedScheduleOutput: json['bookedScheduleOutput'] != null
          ? BookedScheduleOutput.fromJson(json['bookedScheduleOutput'] as Map<String, dynamic>)
          : null,
      currentBookedSchedule: json['currentBookedSchedule'] != null
          ? BookedScheduleRow.fromJson(json['currentBookedSchedule'] as Map<String, dynamic>)
          : null,
    );
  }

  ScheduleState copyWith({
    BookedScheduleOutput? bookedScheduleOutput,
    BookedScheduleRow? currentBookedSchedule,
  }) {
    return ScheduleState(
      bookedScheduleOutput: bookedScheduleOutput ?? this.bookedScheduleOutput,
      currentBookedSchedule: currentBookedSchedule ?? this.currentBookedSchedule,
    );
  }

}