import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class ScheduleState extends WidgetState {
  final BookedScheduleOutput? bookedScheduleOutput;
  final BookedScheduleOutput? bookedHistoryOutput;
  final BookedScheduleRow? currentBookedHistory;
  final BookedScheduleRow? currentBookedSchedule;
  final int? currentHistoryPages;
  final int? totalSchedulePages;
  final int? totalHistoryPages;

  const ScheduleState({
    this.bookedScheduleOutput,
    this.bookedHistoryOutput,
    this.currentBookedSchedule,
    this.currentBookedHistory,
    this.currentHistoryPages,
    this.totalSchedulePages,
    this.totalHistoryPages,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    bookedScheduleOutput,
    bookedHistoryOutput,
    currentBookedSchedule,
    currentBookedHistory,
    totalSchedulePages,
    totalHistoryPages,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bookedScheduleOutput': bookedScheduleOutput?.toJson(),
        'bookedHistoryOutput': bookedHistoryOutput?.toJson(),
      'currentBookedSchedule': currentBookedSchedule?.toJson(),
      'currentBookedHistory': currentBookedHistory?.toJson(),
      'currentHistoryPages': currentHistoryPages,
      'totalSchedulePages': totalSchedulePages,
      'totalHistoryPages': totalHistoryPages,
    };
  }

  factory ScheduleState.fromJson(Map<String, dynamic> json) {
    return ScheduleState(
      bookedScheduleOutput: json['bookedScheduleOutput'] != null
          ? BookedScheduleOutput.fromJson(json['bookedScheduleOutput'] as Map<String, dynamic>)
          : null,
      bookedHistoryOutput: json['bookedHistoryOutput'] != null
          ? BookedScheduleOutput.fromJson(json['bookedHistoryOutput'] as Map<String, dynamic>)
          : null,
      currentBookedSchedule: json['currentBookedSchedule'] != null
          ? BookedScheduleRow.fromJson(json['currentBookedSchedule'] as Map<String, dynamic>)
          : null,
      currentBookedHistory: json['currentBookedHistory'] != null
          ? BookedScheduleRow.fromJson(json['currentBookedHistory'] as Map<String, dynamic>)
          : null,
      currentHistoryPages: json['currentHistoryPages'] as int?,
      totalSchedulePages: json['totalSchedulePages'] as int?,
      totalHistoryPages: json['totalHistoryPages'] as int?,
    );
  }

  ScheduleState copyWith({
    BookedScheduleOutput? bookedScheduleOutput,
    BookedScheduleOutput? bookedHistoryOutput,
    BookedScheduleRow? currentBookedSchedule,
    BookedScheduleRow? currentBookedHistory,
    int? currentHistoryPages,
    int? totalSchedulePages,
    int? totalHistoryPages,
  }) {
    return ScheduleState(
      bookedScheduleOutput: bookedScheduleOutput ?? this.bookedScheduleOutput,
      bookedHistoryOutput: bookedHistoryOutput ?? this.bookedHistoryOutput,
      currentBookedSchedule: currentBookedSchedule ?? this.currentBookedSchedule,
      currentBookedHistory: currentBookedHistory ?? this.currentBookedHistory,
      currentHistoryPages: currentHistoryPages ?? this.currentHistoryPages,
      totalSchedulePages: totalSchedulePages ?? this.totalSchedulePages,
      totalHistoryPages: totalHistoryPages ?? this.totalHistoryPages,
    );
  }

}