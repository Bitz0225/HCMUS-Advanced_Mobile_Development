import 'package:lettutor/core/data_source/network/models/base_model.dart';

class CancelBookedScheduleInput extends BaseModel {
  final String? scheduleDetailId;
  final CancelInfo? cancelInfo;

  const CancelBookedScheduleInput({
    this.scheduleDetailId,
    this.cancelInfo,
  });

  CancelBookedScheduleInput copyWith({
    String? scheduleDetailId,
    CancelInfo? cancelInfo,
  }) =>
      CancelBookedScheduleInput(
        scheduleDetailId: scheduleDetailId ?? this.scheduleDetailId,
        cancelInfo: cancelInfo ?? this.cancelInfo,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        scheduleDetailId,
        cancelInfo,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'scheduleDetailId': scheduleDetailId,
      'cancelInfo': cancelInfo?.toJson(),
    };
  }

  factory CancelBookedScheduleInput.fromJson(Map<String, dynamic> json) {
    return CancelBookedScheduleInput(
      scheduleDetailId: json['scheduleDetailId'] as String?,
      cancelInfo: json['cancelInfo'] != null
          ? CancelInfo.fromJson(json['cancelInfo'] as Map<String, dynamic>)
          : null,
    );
  }
}

class CancelInfo extends BaseModel {
  final int? cancelReasonId;
  final String? note;

  const CancelInfo({
    this.cancelReasonId,
    this.note,
  });

  CancelInfo copyWith({
    int? cancelReasonId,
    String? note,
  }) =>
      CancelInfo(
        cancelReasonId: cancelReasonId ?? this.cancelReasonId,
        note: note ?? this.note,
      );

  @override
  List<Object?> get props => [
        cancelReasonId,
        note,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'cancelReasonId': cancelReasonId,
      'note': note,
    };
  }

  factory CancelInfo.fromJson(Map<String, dynamic> json) {
    return CancelInfo(
      cancelReasonId: json['cancelReasonId'] as int?,
      note: json['note'] as String?,
    );
  }
}
