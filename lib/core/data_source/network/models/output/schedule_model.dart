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

  factory ScheduleOfTutor.fromJson(Map<String, dynamic> json) => ScheduleOfTutor(
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
