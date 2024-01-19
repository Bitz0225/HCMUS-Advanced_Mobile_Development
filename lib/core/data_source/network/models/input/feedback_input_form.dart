import 'package:lettutor/core/data_source/network/models/base_model.dart';

class FeedbackInputForm extends BaseModel {
  final String? bookingId;
  final String? content;
  final int? rating;
  final String? userId;

  const FeedbackInputForm({
    this.bookingId,
    this.content,
    this.rating,
    this.userId,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        bookingId,
        content,
        rating,
        userId,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'bookingId': bookingId,
      'content': content,
      'rating': rating,
      'userId': userId,
    };
  }

  factory FeedbackInputForm.fromJson(Map<String, dynamic> json) {
    return FeedbackInputForm(
      bookingId: json['bookingId'] as String?,
      content: json['content'] as String?,
      rating: json['rating'] as int?,
      userId: json['userId'] as String?,
    );
  }
}
