import 'package:lettutor/core/data_source/network/models/base_model.dart';

class ScheduleOutput extends BaseModel {
  final String? message;
  final List<ScheduleOfTutor>? scheduleOfTutor;

  const ScheduleOutput({
    this.message,
    this.scheduleOfTutor,
  });

  ScheduleOutput copyWith({
    String? message,
    List<ScheduleOfTutor>? scheduleOfTutor,
  }) =>
      ScheduleOutput(
        message: message ?? this.message,
        scheduleOfTutor: scheduleOfTutor ?? this.scheduleOfTutor,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
        scheduleOfTutor,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'scheduleOfTutor': scheduleOfTutor,
    };
  }

  factory ScheduleOutput.fromJson(Map<String, dynamic> json) => ScheduleOutput(
        message: json['message'] as String?,
        scheduleOfTutor: (json['scheduleOfTutor'] as List<dynamic>?)
            ?.map((e) => ScheduleOfTutor.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class ScheduleOfTutor extends BaseModel {
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? createdAt;
  final bool? isBooked;
  final List<ScheduleDetail>? scheduleDetails;

  const ScheduleOfTutor({
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.startTimestamp,
    this.endTimestamp,
    this.createdAt,
    this.isBooked,
    this.scheduleDetails,
  });

  ScheduleOfTutor copyWith({
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    int? startTimestamp,
    int? endTimestamp,
    String? createdAt,
    bool? isBooked,
    List<ScheduleDetail>? scheduleDetails,
  }) =>
      ScheduleOfTutor(
        id: id ?? this.id,
        tutorId: tutorId ?? this.tutorId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        endTimestamp: endTimestamp ?? this.endTimestamp,
        createdAt: createdAt ?? this.createdAt,
        isBooked: isBooked ?? this.isBooked,
        scheduleDetails: scheduleDetails ?? this.scheduleDetails,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        tutorId,
        startTime,
        endTime,
        startTimestamp,
        endTimestamp,
        createdAt,
        isBooked,
        scheduleDetails,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tutorId': tutorId,
      'startTime': startTime,
      'endTime': endTime,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'createdAt': createdAt,
      'isBooked': isBooked,
      'scheduleDetails': scheduleDetails,
    };
  }

  factory ScheduleOfTutor.fromJson(Map<String, dynamic> json) =>
      ScheduleOfTutor(
        id: json['id'] as String?,
        tutorId: json['tutorId'] as String?,
        startTime: json['startTime'] as String?,
        endTime: json['endTime'] as String?,
        startTimestamp: json['startTimestamp'] as int?,
        endTimestamp: json['endTimestamp'] as int?,
        createdAt: json['createdAt'] as String?,
        isBooked: json['isBooked'] as bool?,
        scheduleDetails: (json['scheduleDetails'] as List<dynamic>?)
            ?.map((e) => ScheduleDetail.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}

class ScheduleDetail extends BaseModel {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final String? createdAt;
  final String? updatedAt;
  final List<BookingInfo>? bookingInfo;
  final bool? isBooked;

  const ScheduleDetail({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.bookingInfo,
    this.isBooked,
  });

  ScheduleDetail copyWith({
    int? startPeriodTimestamp,
    int? endPeriodTimestamp,
    String? id,
    String? scheduleId,
    String? startPeriod,
    String? endPeriod,
    String? createdAt,
    String? updatedAt,
    List<BookingInfo>? bookingInfo,
    bool? isBooked,
  }) =>
      ScheduleDetail(
        startPeriodTimestamp: startPeriodTimestamp ?? this.startPeriodTimestamp,
        endPeriodTimestamp: endPeriodTimestamp ?? this.endPeriodTimestamp,
        id: id ?? this.id,
        scheduleId: scheduleId ?? this.scheduleId,
        startPeriod: startPeriod ?? this.startPeriod,
        endPeriod: endPeriod ?? this.endPeriod,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        bookingInfo: bookingInfo ?? this.bookingInfo,
        isBooked: isBooked ?? this.isBooked,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        startPeriodTimestamp,
        endPeriodTimestamp,
        id,
        scheduleId,
        startPeriod,
        endPeriod,
        createdAt,
        updatedAt,
        bookingInfo,
        isBooked,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'startPeriodTimestamp': startPeriodTimestamp,
      'endPeriodTimestamp': endPeriodTimestamp,
      'id': id,
      'scheduleId': scheduleId,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'bookingInfo': bookingInfo,
      'isBooked': isBooked,
    };
  }

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
        startPeriodTimestamp: json['startPeriodTimestamp'] as int?,
        endPeriodTimestamp: json['endPeriodTimestamp'] as int?,
        id: json['id'] as String?,
        scheduleId: json['scheduleId'] as String?,
        startPeriod: json['startPeriod'] as String?,
        endPeriod: json['endPeriod'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        bookingInfo: (json['bookingInfo'] as List<dynamic>?)
            ?.map((e) => BookingInfo.fromJson(e as Map<String, dynamic>))
            .toList(),
        isBooked: json['isBooked'] as bool?,
      );
}

class BookingInfo extends BaseModel {
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? id;
  final bool? isDeleted;
  final String? createdAt;
  final String? scheduleDetailId;
  final String? updatedAt;
  final int? cancelReasonId;
  final String? userId;

  const BookingInfo({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.isDeleted,
    this.createdAt,
    this.scheduleDetailId,
    this.updatedAt,
    this.cancelReasonId,
    this.userId,
  });

  BookingInfo copyWith({
    int? createdAtTimeStamp,
    int? updatedAtTimeStamp,
    String? id,
    bool? isDeleted,
    String? createdAt,
    String? scheduleDetailId,
    String? updatedAt,
    int? cancelReasonId,
    String? userId,
  }) =>
      BookingInfo(
        createdAtTimeStamp: createdAtTimeStamp ?? this.createdAtTimeStamp,
        updatedAtTimeStamp: updatedAtTimeStamp ?? this.updatedAtTimeStamp,
        id: id ?? this.id,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        scheduleDetailId: scheduleDetailId ?? this.scheduleDetailId,
        updatedAt: updatedAt ?? this.updatedAt,
        cancelReasonId: cancelReasonId ?? this.cancelReasonId,
        userId: userId ?? this.userId,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        isDeleted,
        createdAt,
        scheduleDetailId,
        updatedAt,
        cancelReasonId,
        userId,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'createdAtTimeStamp': createdAtTimeStamp,
      'updatedAtTimeStamp': updatedAtTimeStamp,
      'id': id,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'scheduleDetailId': scheduleDetailId,
      'updatedAt': updatedAt,
      'cancelReasonId': cancelReasonId,
      'userId': userId,
    };
  }

  factory BookingInfo.fromJson(Map<String, dynamic> json) => BookingInfo(
        createdAtTimeStamp: json['createdAtTimeStamp'] as int?,
        updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
        id: json['id'] as String?,
        isDeleted: json['isDeleted'] as bool?,
        createdAt: json['createdAt'] as String?,
        scheduleDetailId: json['scheduleDetailId'] as String?,
        updatedAt: json['updatedAt'] as String?,
        cancelReasonId: json['cancelReasonId'] as int?,
        userId: json['userId'] as String?,
      );
}

class BookedScheduleOutput extends BaseModel {
  final String? message;
  final BookedScheduleData? data;

  const BookedScheduleOutput({
    this.message,
    this.data,
  });

  @override
  // TODO: implement props
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

  factory BookedScheduleOutput.fromJson(Map<String, dynamic> json) =>
      BookedScheduleOutput(
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : BookedScheduleData.fromJson(json['data'] as Map<String, dynamic>),
      );

  BookedScheduleOutput copyWith({
    String? message,
    BookedScheduleData? data,
  }) =>
      BookedScheduleOutput(
        message: message ?? this.message,
        data: data ?? this.data,
      );
}

class BookedScheduleData extends BaseModel {
  final int? count;
  final List<BookedScheduleRow>? rows;

  const BookedScheduleData({
    this.count,
    this.rows,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        count,
        rows,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rows': rows,
    };
  }

  factory BookedScheduleData.fromJson(Map<String, dynamic> json) =>
      BookedScheduleData(
        count: json['count'] as int?,
        rows: (json['rows'] as List<dynamic>?)
            ?.map((e) => BookedScheduleRow.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  BookedScheduleData copyWith({
    int? count,
    List<BookedScheduleRow>? rows,
  }) =>
      BookedScheduleData(
        count: count ?? this.count,
        rows: rows ?? this.rows,
      );
}

class BookedScheduleRow extends BaseModel {
  final int? createdAtTimeStamp;
  final int? updatedAtTimeStamp;
  final String? id;
  final String? userId;
  final String? scheduleDetailId;
  final String? tutorMeetingLink;
  final String? studentMeetingLink;
  final String? googleMeetLink;
  final String? studentRequest;
  final String? tutorReview;
  final num? scoreByTutor;
  final String? createdAt;
  final String? updatedAt;
  final String? recordUrl;
  final String? cancelReasonId;
  final String? lessonPlanId;
  final String? cancelNote;
  final String? calendarId;
  final bool? isDeleted;
  final bool? isTrial;
  final int? convertedLesson;
  final BookedScheduleDetailInfo? scheduleDetailInfo;
  final String? classReview;
  final String? trialBookingReview;
  final bool? showRecordUrl;
  final List<String>? studentMaterials;
  final List<String>? feedbacks;

  const BookedScheduleRow({
    this.createdAtTimeStamp,
    this.updatedAtTimeStamp,
    this.id,
    this.userId,
    this.scheduleDetailId,
    this.tutorMeetingLink,
    this.studentMeetingLink,
    this.googleMeetLink,
    this.studentRequest,
    this.tutorReview,
    this.scoreByTutor,
    this.createdAt,
    this.updatedAt,
    this.recordUrl,
    this.cancelReasonId,
    this.lessonPlanId,
    this.cancelNote,
    this.calendarId,
    this.isDeleted,
    this.isTrial,
    this.convertedLesson,
    this.scheduleDetailInfo,
    this.classReview,
    this.trialBookingReview,
    this.showRecordUrl,
    this.studentMaterials,
    this.feedbacks,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        createdAtTimeStamp,
        updatedAtTimeStamp,
        id,
        userId,
        scheduleDetailId,
        tutorMeetingLink,
        studentMeetingLink,
        googleMeetLink,
        studentRequest,
        tutorReview,
        scoreByTutor,
        createdAt,
        updatedAt,
        recordUrl,
        cancelReasonId,
        lessonPlanId,
        cancelNote,
        calendarId,
        isDeleted,
        isTrial,
        convertedLesson,
        scheduleDetailInfo,
        classReview,
        trialBookingReview,
        showRecordUrl,
        studentMaterials,
        feedbacks,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'createdAtTimeStamp': createdAtTimeStamp,
      'updatedAtTimeStamp': updatedAtTimeStamp,
      'id': id,
      'userId': userId,
      'scheduleDetailId': scheduleDetailId,
      'tutorMeetingLink': tutorMeetingLink,
      'studentMeetingLink': studentMeetingLink,
      'googleMeetLink': googleMeetLink,
      'studentRequest': studentRequest,
      'tutorReview': tutorReview,
      'scoreByTutor': scoreByTutor,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'recordUrl': recordUrl,
      'cancelReasonId': cancelReasonId,
      'lessonPlanId': lessonPlanId,
      'cancelNote': cancelNote,
      'calendarId': calendarId,
      'isDeleted': isDeleted,
      'isTrial': isTrial,
      'convertedLesson': convertedLesson,
      'scheduleDetailInfo': scheduleDetailInfo,
      'classReview': classReview,
      'trialBookingReview': trialBookingReview,
      'showRecordUrl': showRecordUrl,
      'studentMaterials': studentMaterials,
      'feedbacks': feedbacks,
    };
  }

  factory BookedScheduleRow.fromJson(Map<String, dynamic> json) =>
      BookedScheduleRow(
        createdAtTimeStamp: json['createdAtTimeStamp'] as int?,
        updatedAtTimeStamp: json['updatedAtTimeStamp'] as int?,
        id: json['id'] as String?,
        userId: json['userId'] as String?,
        scheduleDetailId: json['scheduleDetailId'] as String?,
        tutorMeetingLink: json['tutorMeetingLink'] as String?,
        studentMeetingLink: json['studentMeetingLink'] as String?,
        googleMeetLink: json['googleMeetLink'] as String?,
        studentRequest: json['studentRequest'] as String?,
        tutorReview: json['tutorReview'] as String?,
        scoreByTutor: json['scoreByTutor'] as num?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        recordUrl: json['recordUrl'] as String?,
        cancelReasonId: json['cancelReasonId'] as String?,
        lessonPlanId: json['lessonPlanId'] as String?,
        cancelNote: json['cancelNote'] as String?,
        calendarId: json['calendarId'] as String?,
        isDeleted: json['isDeleted'] as bool?,
        isTrial: json['isTrial'] as bool?,
        convertedLesson: json['convertedLesson'] as int?,
        scheduleDetailInfo: json['scheduleDetailInfo'] == null
            ? null
            : BookedScheduleDetailInfo.fromJson(
                json['scheduleDetailInfo'] as Map<String, dynamic>),
        classReview: json['classReview'] as String?,
        trialBookingReview: json['trialBookingReview'] as String?,
        showRecordUrl: json['showRecordUrl'] as bool?,
        studentMaterials: (json['studentMaterials'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        feedbacks: (json['feedbacks'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );

  BookedScheduleRow copyWith({
    int? createdAtTimeStamp,
    int? updatedAtTimeStamp,
    String? id,
    String? userId,
    String? scheduleDetailId,
    String? tutorMeetingLink,
    String? studentMeetingLink,
    String? googleMeetLink,
    String? studentRequest,
    String? tutorReview,
    num? scoreByTutor,
    String? createdAt,
    String? updatedAt,
    String? recordUrl,
    String? cancelReasonId,
    String? lessonPlanId,
    String? cancelNote,
    String? calendarId,
    bool? isDeleted,
    bool? isTrial,
    int? convertedLesson,
    BookedScheduleDetailInfo? scheduleDetailInfo,
    String? classReview,
    String? trialBookingReview,
    bool? showRecordUrl,
    List<String>? studentMaterials,
    List<String>? feedbacks,
  }) =>
      BookedScheduleRow(
        createdAtTimeStamp: createdAtTimeStamp ?? this.createdAtTimeStamp,
        updatedAtTimeStamp: updatedAtTimeStamp ?? this.updatedAtTimeStamp,
        id: id ?? this.id,
        userId: userId ?? this.userId,
        scheduleDetailId: scheduleDetailId ?? this.scheduleDetailId,
        tutorMeetingLink: tutorMeetingLink ?? this.tutorMeetingLink,
        studentMeetingLink: studentMeetingLink ?? this.studentMeetingLink,
        googleMeetLink: googleMeetLink ?? this.googleMeetLink,
        studentRequest: studentRequest ?? this.studentRequest,
        tutorReview: tutorReview ?? this.tutorReview,
        scoreByTutor: scoreByTutor ?? this.scoreByTutor,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        recordUrl: recordUrl ?? this.recordUrl,
        cancelReasonId: cancelReasonId ?? this.cancelReasonId,
        lessonPlanId: lessonPlanId ?? this.lessonPlanId,
        cancelNote: cancelNote ?? this.cancelNote,
        calendarId: calendarId ?? this.calendarId,
        isDeleted: isDeleted ?? this.isDeleted,
        isTrial: isTrial ?? this.isTrial,
        convertedLesson: convertedLesson ?? this.convertedLesson,
        scheduleDetailInfo: scheduleDetailInfo ?? this.scheduleDetailInfo,
        classReview: classReview ?? this.classReview,
        trialBookingReview: trialBookingReview ?? this.trialBookingReview,
        showRecordUrl: showRecordUrl ?? this.showRecordUrl,
        studentMaterials: studentMaterials ?? this.studentMaterials,
        feedbacks: feedbacks ?? this.feedbacks,
      );
}

class BookedScheduleDetailInfo extends BaseModel {
  final int? startPeriodTimestamp;
  final int? endPeriodTimestamp;
  final String? id;
  final String? scheduleId;
  final String? startPeriod;
  final String? endPeriod;
  final String? createdAt;
  final String? updatedAt;
  final BookedScheduleInfo? scheduleInfo;

  const BookedScheduleDetailInfo({
    this.startPeriodTimestamp,
    this.endPeriodTimestamp,
    this.id,
    this.scheduleId,
    this.startPeriod,
    this.endPeriod,
    this.createdAt,
    this.updatedAt,
    this.scheduleInfo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        startPeriodTimestamp,
        endPeriodTimestamp,
        id,
        scheduleId,
        startPeriod,
        endPeriod,
        createdAt,
        updatedAt,
        scheduleInfo,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'startPeriodTimestamp': startPeriodTimestamp,
      'endPeriodTimestamp': endPeriodTimestamp,
      'id': id,
      'scheduleId': scheduleId,
      'startPeriod': startPeriod,
      'endPeriod': endPeriod,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'scheduleInfo': scheduleInfo,
    };
  }

  factory BookedScheduleDetailInfo.fromJson(Map<String, dynamic> json) =>
      BookedScheduleDetailInfo(
        startPeriodTimestamp: json['startPeriodTimestamp'] as int?,
        endPeriodTimestamp: json['endPeriodTimestamp'] as int?,
        id: json['id'] as String?,
        scheduleId: json['scheduleId'] as String?,
        startPeriod: json['startPeriod'] as String?,
        endPeriod: json['endPeriod'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        scheduleInfo: json['scheduleInfo'] == null
            ? null
            : BookedScheduleInfo.fromJson(
                json['scheduleInfo'] as Map<String, dynamic>),
      );

  BookedScheduleDetailInfo copyWith({
    int? startPeriodTimestamp,
    int? endPeriodTimestamp,
    String? id,
    String? scheduleId,
    String? startPeriod,
    String? endPeriod,
    String? createdAt,
    String? updatedAt,
    BookedScheduleInfo? scheduleInfo,
  }) =>
      BookedScheduleDetailInfo(
        startPeriodTimestamp: startPeriodTimestamp ?? this.startPeriodTimestamp,
        endPeriodTimestamp: endPeriodTimestamp ?? this.endPeriodTimestamp,
        id: id ?? this.id,
        scheduleId: scheduleId ?? this.scheduleId,
        startPeriod: startPeriod ?? this.startPeriod,
        endPeriod: endPeriod ?? this.endPeriod,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        scheduleInfo: scheduleInfo ?? this.scheduleInfo,
      );
}

class BookedScheduleInfo extends BaseModel {
  final String? date;
  final int? startTimestamp;
  final int? endTimestamp;
  final String? id;
  final String? tutorId;
  final String? startTime;
  final String? endTime;
  final bool? isDeleted;
  final String? createdAt;
  final String? updatedAt;
  final BookedScheduleTutorInfo? tutorInfo;

  const BookedScheduleInfo({
    this.date,
    this.startTimestamp,
    this.endTimestamp,
    this.id,
    this.tutorId,
    this.startTime,
    this.endTime,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.tutorInfo,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        date,
        startTimestamp,
        endTimestamp,
        id,
        tutorId,
        startTime,
        endTime,
        isDeleted,
        createdAt,
        updatedAt,
        tutorInfo,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp,
      'id': id,
      'tutorId': tutorId,
      'startTime': startTime,
      'endTime': endTime,
      'isDeleted': isDeleted,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'tutorInfo': tutorInfo,
    };
  }

  factory BookedScheduleInfo.fromJson(Map<String, dynamic> json) =>
      BookedScheduleInfo(
        date: json['date'] as String?,
        startTimestamp: json['startTimestamp'] as int?,
        endTimestamp: json['endTimestamp'] as int?,
        id: json['id'] as String?,
        tutorId: json['tutorId'] as String?,
        startTime: json['startTime'] as String?,
        endTime: json['endTime'] as String?,
        isDeleted: json['isDeleted'] as bool?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        tutorInfo: json['tutorInfo'] == null
            ? null
            : BookedScheduleTutorInfo.fromJson(
                json['tutorInfo'] as Map<String, dynamic>),
      );

  BookedScheduleInfo copyWith({
    String? date,
    int? startTimestamp,
    int? endTimestamp,
    String? id,
    String? tutorId,
    String? startTime,
    String? endTime,
    bool? isDeleted,
    String? createdAt,
    String? updatedAt,
    BookedScheduleTutorInfo? tutorInfo,
  }) =>
      BookedScheduleInfo(
        date: date ?? this.date,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        endTimestamp: endTimestamp ?? this.endTimestamp,
        id: id ?? this.id,
        tutorId: tutorId ?? this.tutorId,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        isDeleted: isDeleted ?? this.isDeleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        tutorInfo: tutorInfo ?? this.tutorInfo,
      );
}

class BookedScheduleTutorInfo extends BaseModel {
  final String? id;
  final String? level;
  final String? email;
  final String? google;
  final String? facebook;
  final String? apple;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final String? isPhoneActivated;
  final String? requireNote;
  final int? timezone;
  final String? phoneAuth;
  final bool? isPhoneAuthActivated;
  final String? studySchedule;
  final bool? canSendMessage;
  final bool? isPublicRecord;
  final String? caredByStaffId;
  final String? zaloUserId;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final String? studentGroupId;

  const BookedScheduleTutorInfo({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.avatar,
    this.name,
    this.country,
    this.phone,
    this.language,
    this.birthday,
    this.requestPassword,
    this.isActivated,
    this.isPhoneActivated,
    this.requireNote,
    this.timezone,
    this.phoneAuth,
    this.isPhoneAuthActivated,
    this.studySchedule,
    this.canSendMessage,
    this.isPublicRecord,
    this.caredByStaffId,
    this.zaloUserId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.studentGroupId,
  });

  BookedScheduleTutorInfo copyWith({
    String? id,
    String? level,
    String? email,
    String? google,
    String? facebook,
    String? apple,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    String? isPhoneActivated,
    String? requireNote,
    int? timezone,
    String? phoneAuth,
    bool? isPhoneAuthActivated,
    String? studySchedule,
    bool? canSendMessage,
    bool? isPublicRecord,
    String? caredByStaffId,
    String? zaloUserId,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    String? studentGroupId,
  }) =>
      BookedScheduleTutorInfo(
        id: id ?? this.id,
        level: level ?? this.level,
        email: email ?? this.email,
        google: google ?? this.google,
        facebook: facebook ?? this.facebook,
        apple: apple ?? this.apple,
        avatar: avatar ?? this.avatar,
        name: name ?? this.name,
        country: country ?? this.country,
        phone: phone ?? this.phone,
        language: language ?? this.language,
        birthday: birthday ?? this.birthday,
        requestPassword: requestPassword ?? this.requestPassword,
        isActivated: isActivated ?? this.isActivated,
        isPhoneActivated: isPhoneActivated ?? this.isPhoneActivated,
        requireNote: requireNote ?? this.requireNote,
        timezone: timezone ?? this.timezone,
        phoneAuth: phoneAuth ?? this.phoneAuth,
        isPhoneAuthActivated: isPhoneAuthActivated ?? this.isPhoneAuthActivated,
        studySchedule: studySchedule ?? this.studySchedule,
        canSendMessage: canSendMessage ?? this.canSendMessage,
        isPublicRecord: isPublicRecord ?? this.isPublicRecord,
        caredByStaffId: caredByStaffId ?? this.caredByStaffId,
        zaloUserId: zaloUserId ?? this.zaloUserId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        studentGroupId: studentGroupId ?? this.studentGroupId,
      );

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level': level,
      'email': email,
      'google': google,
      'facebook': facebook,
      'apple': apple,
      'avatar': avatar,
      'name': name,
      'country': country,
      'phone': phone,
      'language': language,
      'birthday': birthday,
      'requestPassword': requestPassword,
      'isActivated': isActivated,
      'isPhoneActivated': isPhoneActivated,
      'requireNote': requireNote,
      'timezone': timezone,
      'phoneAuth': phoneAuth,
      'isPhoneAuthActivated': isPhoneAuthActivated,
      'studySchedule': studySchedule,
      'canSendMessage': canSendMessage,
      'isPublicRecord': isPublicRecord,
      'caredByStaffId': caredByStaffId,
      'zaloUserId': zaloUserId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'studentGroupId': studentGroupId,
    };
  }

  factory BookedScheduleTutorInfo.fromJson(Map<String, dynamic> json) =>
      BookedScheduleTutorInfo(
        id: json['id'] as String?,
        level: json['level'] as String?,
        email: json['email'] as String?,
        google: json['google'] as String?,
        facebook: json['facebook'] as String?,
        apple: json['apple'] as String?,
        avatar: json['avatar'] as String?,
        name: json['name'] as String?,
        country: json['country'] as String?,
        phone: json['phone'] as String?,
        language: json['language'] as String?,
        birthday: json['birthday'] as String?,
        requestPassword: json['requestPassword'] as bool?,
        isActivated: json['isActivated'] as bool?,
        isPhoneActivated: json['isPhoneActivated'] as String?,
        requireNote: json['requireNote'] as String?,
        timezone: json['timezone'] as int?,
        phoneAuth: json['phoneAuth'] as String?,
        isPhoneAuthActivated: json['isPhoneAuthActivated'] as bool?,
        studySchedule: json['studySchedule'] as String?,
        canSendMessage: json['canSendMessage'] as bool?,
        isPublicRecord: json['isPublicRecord'] as bool?,
        caredByStaffId: json['caredByStaffId'] as String?,
        zaloUserId: json['zaloUserId'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        deletedAt: json['deletedAt'] as String?,
        studentGroupId: json['studentGroupId'] as String?,
      );

  @override
  List<Object?> get props => [
        id,
        level,
        email,
        google,
        facebook,
        apple,
        avatar,
        name,
        country,
        phone,
        language,
        birthday,
        requestPassword,
        isActivated,
        isPhoneActivated,
        requireNote,
        timezone,
        phoneAuth,
        isPhoneAuthActivated,
        studySchedule,
        canSendMessage,
        isPublicRecord,
        caredByStaffId,
        zaloUserId,
        createdAt,
        updatedAt,
        deletedAt,
        studentGroupId,
      ];
}

class BookedScheduleMessage extends BaseModel {
  final String? message;

  const BookedScheduleMessage({
    this.message,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        message,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  factory BookedScheduleMessage.fromJson(Map<String, dynamic> json) => BookedScheduleMessage(
    message: json['message'] as String?,
  );

  BookedScheduleMessage copyWith({
    String? message,
  }) =>
      BookedScheduleMessage(
        message: message ?? this.message,
      );
}
