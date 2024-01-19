import 'package:lettutor/core/data_source/network/models/base_model.dart';

class FeedbackOutput extends BaseModel {
  final String? message;
  final FeedbackData? data;

  const FeedbackOutput({
    this.message,
    this.data,
  });

  FeedbackOutput copyWith({
    String? message,
    FeedbackData? data,
  }) =>
      FeedbackOutput(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [message, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.toJson(),
    };
  }

  factory FeedbackOutput.fromJson(Map<String, dynamic> json) => FeedbackOutput(
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : FeedbackData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

class FeedbackData extends BaseModel {
  final int? count;
  final List<FeedbackRows>? rows;

  const FeedbackData({
    this.count,
    this.rows,
  });

  FeedbackData copyWith({
    int? count,
    List<FeedbackRows>? rows,
  }) =>
      FeedbackData(
        count: count ?? this.count,
        rows: rows ?? this.rows,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [count, rows];

  @override
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rows': rows?.map((x) => x.toJson()).toList(),
    };
  }

  factory FeedbackData.fromJson(Map<String, dynamic> json) => FeedbackData(
    count: json['count'] as int?,
    rows: (json['rows'] as List<dynamic>?)
        ?.map((e) => FeedbackRows.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

class FeedbackRows extends BaseModel {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final int? rating;
  final String? content;
  final String? createdAt;
  final String? updatedAt;
  final FirstInfo? firstInfo;

  const FeedbackRows({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.rating,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.firstInfo,
  });

  FeedbackRows copyWith({
    String? id,
    String? bookingId,
    String? firstId,
    String? secondId,
    int? rating,
    String? content,
    String? createdAt,
    String? updatedAt,
    FirstInfo? firstInfo,
  }) =>
      FeedbackRows(
        id: id ?? this.id,
        bookingId: bookingId ?? this.bookingId,
        firstId: firstId ?? this.firstId,
        secondId: secondId ?? this.secondId,
        rating: rating ?? this.rating,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        firstInfo: firstInfo ?? this.firstInfo,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    bookingId,
    firstId,
    secondId,
    rating,
    content,
    createdAt,
    updatedAt,
    firstInfo,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingId': bookingId,
      'firstId': firstId,
      'secondId': secondId,
      'rating': rating,
      'content': content,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'firstInfo': firstInfo?.toJson(),
    };
  }

  factory FeedbackRows.fromJson(Map<String, dynamic> json) => FeedbackRows(
    id: json['id'] as String?,
    bookingId: json['bookingId'] as String?,
    firstId: json['firstId'] as String?,
    secondId: json['secondId'] as String?,
    rating: json['rating'] as int?,
    content: json['content'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    firstInfo: json['firstInfo'] == null
        ? null
        : FirstInfo.fromJson(json['firstInfo'] as Map<String, dynamic>),
  );
}

class FirstInfo extends BaseModel{
  final String? name;
  final String? avatar;

  const FirstInfo({
    this.name,
    this.avatar,
  });

  FirstInfo copyWith({
    String? name,
    String? avatar,
  }) =>
      FirstInfo(
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [name, avatar];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'avatar': avatar,
    };
  }

  factory FirstInfo.fromJson(Map<String, dynamic> json) => FirstInfo(
    name: json['name'] as String?,
    avatar: json['avatar'] as String?,
  );
}

class FeedbackTutorOutput extends BaseModel {
  final String? message;
  final FeedbackTutorData? data;

  const FeedbackTutorOutput({
    this.message,
    this.data,
  });

  FeedbackTutorOutput copyWith({
    String? message,
    FeedbackTutorData? data,
  }) =>
      FeedbackTutorOutput(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [message, data];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.toJson(),
    };
  }

  factory FeedbackTutorOutput.fromJson(Map<String, dynamic> json) => FeedbackTutorOutput(
    message: json['message'] as String?,
    data: json['data'] == null
        ? null
        : FeedbackTutorData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

class FeedbackTutorData extends BaseModel {
  final String? id;
  final String? bookingId;
  final String? firstId;
  final String? secondId;
  final String? content;
  final int? rating;
  final String? updatedAt;
  final String? createdAt;

  const FeedbackTutorData({
    this.id,
    this.bookingId,
    this.firstId,
    this.secondId,
    this.content,
    this.rating,
    this.updatedAt,
    this.createdAt,
  });

  FeedbackTutorData copyWith({
    String? id,
    String? bookingId,
    String? firstId,
    String? secondId,
    String? content,
    int? rating,
    String? updatedAt,
    String? createdAt,
  }) =>
      FeedbackTutorData(
        id: id ?? this.id,
        bookingId: bookingId ?? this.bookingId,
        firstId: firstId ?? this.firstId,
        secondId: secondId ?? this.secondId,
        content: content ?? this.content,
        rating: rating ?? this.rating,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    bookingId,
    firstId,
    secondId,
    content,
    rating,
    updatedAt,
    createdAt,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bookingId': bookingId,
      'firstId': firstId,
      'secondId': secondId,
      'content': content,
      'rating': rating,
      'updatedAt': updatedAt,
      'createdAt': createdAt,
    };
  }

  factory FeedbackTutorData.fromJson(Map<String, dynamic> json) => FeedbackTutorData(
    id: json['id'] as String?,
    bookingId: json['bookingId'] as String?,
    firstId: json['firstId'] as String?,
    secondId: json['secondId'] as String?,
    content: json['content'] as String?,
    rating: json['rating'] as int?,
    updatedAt: json['updatedAt'] as String?,
    createdAt: json['createdAt'] as String?,
  );
}

