import 'package:lettutor/core/data_source/network/models/base_model.dart';

class ReportFormInput extends BaseModel {
  final String? id;
  final String? content;

  ReportFormInput({
    this.id,
    this.content
  });

  factory ReportFormInput.fromJson(Map<String, dynamic> json) {
    return ReportFormInput(
      id: json['id'] as String?,
      content: json['content'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tutorId': id,
      'content': content,
    };
  }

  ReportFormInput copyWith({
    String? id,
    String? content,
  }) {
    return ReportFormInput(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    content,
  ];
}
