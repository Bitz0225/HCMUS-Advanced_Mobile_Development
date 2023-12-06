class FailureModel {
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

  FailureModel.fromJson(Map<String, dynamic> json) :
    statusCode = json['statusCode'] as int?,
    message = json['message'] as String?,
    internalCode = json['internalCode'] as int?;
}
