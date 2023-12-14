import 'package:lettutor/core/data_source/network/models/base_model.dart';

class FailureModel extends BaseModel {
  final int? statusCode;
  final String? message;
  final int? internalCode;

  FailureModel({
    this.statusCode,
    this.message,
    this.internalCode,
  });

  FailureModel copyWith({
    int? statusCode,
    String? message,
    int? internalCode,
  }) =>
      FailureModel(
        statusCode: statusCode ?? this.statusCode,
        message: message ?? this.message,
        internalCode: internalCode ?? this.internalCode,
      );

  @override
  factory FailureModel.fromJson(Map<String, dynamic> json) {
    return FailureModel(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      internalCode: json['internalCode'] as int?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'internalCode': internalCode,
    };
  }
}
