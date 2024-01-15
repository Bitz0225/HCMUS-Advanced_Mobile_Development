import 'package:lettutor/core/data_source/network/models/base_model.dart';

class BookingOutput extends BaseModel {
  final String? message;
  final List<Datum>? data;

  const BookingOutput({
    this.message,
    this.data,
  });

  BookingOutput copyWith({
    String? message,
    List<Datum>? data,
  }) =>
      BookingOutput(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [
        message,
        data,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data,
    };
  }

  factory BookingOutput.fromJson(Map<String, dynamic> json) => BookingOutput(
        message: json['message'] as String?,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class Datum extends BaseModel {
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? id;
  final bool? isDeleted;
  final bool? isTrial;
  final int? convertedLesson;
  final String? userId;
  final String? scheduleDetailId;
  final String? studentRequest;
  final String? createdAt;
  final String? updatedAt;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final String? googleMeetLink;
  final String? tutorReview;
  final num? scoreByTutor;
  final String? recordUrl;
  final String? cancelReasonId;
  final String? lessonPlanId;
  final String? cancelNote;
  final String? calendarId;

  const Datum({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.isDeleted,
    this.isTrial,
    this.convertedLesson,
    this.userId,
    this.scheduleDetailId,
    this.studentRequest,
    this.createdAt,
    this.updatedAt,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.googleMeetLink,
    this.tutorReview,
    this.scoreByTutor,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
  });

  //copyWith
  Datum copyWith({
    int? createdAtTimeStamp,
    int? updatedAtTimeStamp,
    String? id,
    bool? isDeleted,
    bool? isTrial,
    int? convertedLesson,
    String? userId,
    String? scheduleDetailId,
    String? studentRequest,
    String? createdAt,
    String? updatedAt,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    String? googleMeetLink,
    String? tutorReview,
    num? scoreByTutor,
    String? recordUrl,
    String? cancelReasonId,
    String? lessonPlanId,
    String? cancelNote,
    String? calendarId,
  }) =>
      Datum(
        createdAtTimeStamp: createdAtTimeStamp ?? this.createdAtTimeStamp,
        updatedAtTimeStamp: updatedAtTimeStamp ?? this.updatedAtTimeStamp,
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        isTrial: isTrial ?? this.isTrial,
        convertedLesson: convertedLesson ?? this.convertedLesson,
        userId: userId ?? this.userId,
        scheduleDetailId: scheduleDetailId ?? this.scheduleDetailId,
        studentRequest: studentRequest ?? this.studentRequest,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        tutorMeetingLink: tutorMeetingLink ?? this.tutorMeetingLink,
        studentMeetingLink: studentMeetingLink ?? this.studentMeetingLink,
        googleMeetLink: googleMeetLink ?? this.googleMeetLink,
        tutorReview: tutorReview ?? this.tutorReview,
        scoreByTutor: scoreByTutor ?? this.scoreByTutor,
        recordUrl: recordUrl ?? this.recordUrl,
        cancelReasonId: cancelReasonId ?? this.cancelReasonId,
        lessonPlanId: lessonPlanId ?? this.lessonPlanId,
        cancelNote: cancelNote ?? this.cancelNote,
        calendarId: calendarId ?? this.calendarId,
      );

  @override
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        isDeleted,
        isTrial,
        convertedLesson,
        userId,
        scheduleDetailId,
        studentRequest,
        createdAt,
        updatedAt,
        tutorMeetingLink,
        studentMeetingLink,
        googleMeetLink,
        tutorReview,
        scoreByTutor,
        recordUrl,
        cancelReasonId,
        lessonPlanId,
        cancelNote,
        calendarId,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'createdAtTimeStamp': createdAtTimeStamp,
      'updatedAtTimeStamp': updatedAtTimeStamp,
      'id': id,
      'isDeleted': isDeleted,
      'isTrial': isTrial,
      'convertedLesson': convertedLesson,
      'userId': userId,
      'scheduleDetailId': scheduleDetailId,
      'studentRequest': studentRequest,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'tutorMeetingLink': tutorMeetingLink,
      'studentMeetingLink': studentMeetingLink,
      'googleMeetLink': googleMeetLink,
      'tutorReview': tutorReview,
      'scoreByTutor': scoreByTutor,
      'recordUrl': recordUrl,
      'cancelReasonId': cancelReasonId,
      'lessonPlanId': lessonPlanId,
      'cancelNote': cancelNote,
      'calendarId': calendarId,
    };
  }

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      createdAtTimeStamp: json['createdAtTimeStamp'] as int?,
      updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
      id: json['id'] as String?,
      isDeleted: json['isDeleted'] as bool?,
      isTrial: json['isTrial'] as bool?,
      convertedLesson: json['convertedLesson'] as int?,
      userId: json['userId'] as String?,
      scheduleDetailId: json['scheduleDetailId'] as String?,
      studentRequest: json['studentRequest'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      tutorMeetingLink: json['tutorMeetingLink'] as String?,
      studentMeetingLink: json['studentMeetingLink'] as String?,
      googleMeetLink: json['googleMeetLink'] as String?,
      tutorReview: json['tutorReview'] as String?,
      scoreByTutor: json['scoreByTutor'] as num?,
      recordUrl: json['recordUrl'] as String?,
      cancelReasonId: json['cancelReasonId'] as String?,
      lessonPlanId: json['lessonPlanId'] as String?,
      cancelNote: json['cancelNote'] as String?,
      calendarId: json['calendarId'] as String?,
    );
  }
}
