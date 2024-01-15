import 'package:lettutor/core/data_source/network/models/output/feedback_model.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';
import 'package:time_planner/time_planner.dart';

class TutorState extends WidgetState {
  final int? totalPages;
  final int? totalFeedbackPages;
  final int? currentFeedbackPage;
  final int? currentFeedbackPageAmount;
  final int? currentPageAmount;
  final int? currentTimeTablePage;
  final List<ScheduleOfTutor>? scheduleOfTutor;
  final int? startTime;
  final int? endTime;
  final int perPage;
  final int? currentPage;
  final bool? isEmpty;
  final String? tag;
  final DetailTutor? currentDetailTutor;
  final FeedbackOutput? feedbackOutput;
  final List<TutorSearchOutputItem>? tutorList;

  const TutorState(
      {this.totalPages,
      this.feedbackOutput,
      this.currentPageAmount,
      this.currentFeedbackPage = 0,
      this.currentFeedbackPageAmount,
      this.currentTimeTablePage = 0,
      this.scheduleOfTutor,
        this.startTime = 0,
        this.endTime = 23,
      this.totalFeedbackPages,
      this.currentPage = 1,
      this.perPage = 9,
      this.tag,
      this.isEmpty = true,
      this.currentDetailTutor,
      this.tutorList});

  @override
  List<Object?> get props => [
        totalPages,
        tag,
        currentPage,
        currentPageAmount,
        currentFeedbackPage,
        currentFeedbackPageAmount,
        currentTimeTablePage,
        totalFeedbackPages,
        scheduleOfTutor,
        startTime,
        endTime,
        perPage,
        tutorList,
        feedbackOutput,
        currentDetailTutor,
        isEmpty,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory TutorState.fromJson(Map<String, dynamic> json) {
    return TutorState(
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      currentPageAmount: json['currentPageAmount'] as int?,
      currentFeedbackPage: json['currentFeedbackPage'] as int?,
      currentFeedbackPageAmount: json['currentFeedbackPageAmount'] as int?,
      currentTimeTablePage: json['currentTimeTablePage'] as int?,
      scheduleOfTutor: json['scheduleOfTutor'] != null
          ? (json['scheduleOfTutor'] as List)
              .map((e) => ScheduleOfTutor.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      startTime: json['startTime'] as int?,
      endTime: json['endTime'] as int?,
      totalFeedbackPages: json['totalFeedbackPages'] as int?,
      perPage: json['perPage'] as int,
      tag: json['tag'] as String?,
      currentDetailTutor: json['currentDetailTutor'] != null
          ? DetailTutor.fromJson(
              json['currentDetailTutor'] as Map<String, dynamic>)
          : null,
      feedbackOutput: json['feedbackOutput'] != null
          ? FeedbackOutput.fromJson(
              json['feedbackOutput'] as Map<String, dynamic>)
          : null,
      isEmpty: json['isEmpty'] as bool?,
      tutorList: json['tutorList'] != null
          ? (json['tutorList'] as List)
              .map((e) =>
                  TutorSearchOutputItem.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  TutorState copyWith({
    int? totalPages,
    int? currentPage,
    int? perPage,
    int? currentPageAmount,
    int? currentFeedbackPageAmount,
    int? currentFeedbackPage,
    int? currentTimeTablePage,
    List<ScheduleOfTutor>? scheduleOfTutor,
    int? startTime,
    int? endTime,
    int? totalFeedbackPages,
    String? tag,
    FeedbackOutput? feedbackOutput,
    DetailTutor? currentDetailTutor,
    bool? isEmpty,
    List<TutorSearchOutputItem>? tutorList,
  }) {
    return TutorState(
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      currentPageAmount: currentPageAmount ?? this.currentPageAmount,
      currentFeedbackPage: currentFeedbackPage ?? this.currentFeedbackPage,
      currentFeedbackPageAmount:
          currentFeedbackPageAmount ?? this.currentFeedbackPageAmount,
      currentTimeTablePage: currentTimeTablePage ?? this.currentTimeTablePage,
      scheduleOfTutor: scheduleOfTutor ?? this.scheduleOfTutor,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      totalFeedbackPages: totalFeedbackPages ?? this.totalFeedbackPages,
      perPage: perPage ?? this.perPage,
      tag: tag ?? this.tag,
      feedbackOutput: feedbackOutput ?? this.feedbackOutput,
      currentDetailTutor: currentDetailTutor ?? this.currentDetailTutor,
      tutorList: tutorList ?? this.tutorList,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
