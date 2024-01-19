import 'package:lettutor/core/data_source/network/models/base_model.dart';

class ReportHistoryInputForm extends BaseModel {
  final String? bookingId;
  final String? note;
  final int? reasonId;
  final String? userId;

  const ReportHistoryInputForm({
    this.bookingId,
    this.note,
    this.reasonId,
    this.userId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    bookingId,
    note,
    reasonId,
    userId,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'note': note,
      'reasonId': reasonId,
      'userId': userId,
    };
  }

  factory ReportHistoryInputForm.fromJson(Map<String, dynamic> json) {
    return ReportHistoryInputForm(
      bookingId: json['bookingId'] as String?,
      note: json['note'] as String?,
      reasonId: json['reasonId'] as int?,
      userId: json['userId'] as String?,
    );
  }
}
