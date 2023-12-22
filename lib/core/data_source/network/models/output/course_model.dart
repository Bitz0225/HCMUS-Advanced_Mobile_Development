import 'package:lettutor/core/data_source/network/models/base_model.dart';

class Course extends BaseModel {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final String? reason;
  final String? purpose;
  final String? otherDetails;
  final int? defaultPrice;
  final int? coursePrice;
  final String? courseType;
  final String? sectionType;
  final bool? visible;
  final String? displayOrder;
  final String? createdAt;
  final String? updatedAt;
  final TutorCourse? tutorCourse;

  Course({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.reason,
    this.purpose,
    this.otherDetails,
    this.defaultPrice,
    this.coursePrice,
    this.courseType,
    this.sectionType,
    this.visible,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
    this.tutorCourse,
  });

  Course copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? level,
    String? reason,
    String? purpose,
    String? otherDetails,
    int? defaultPrice,
    int? coursePrice,
    String? courseType,
    String? sectionType,
    bool? visible,
    String? displayOrder,
    String? createdAt,
    String? updatedAt,
    TutorCourse? tutorCourse,
  }) =>
      Course(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        level: level ?? this.level,
        reason: reason ?? this.reason,
        purpose: purpose ?? this.purpose,
        otherDetails: otherDetails ?? this.otherDetails,
        defaultPrice: defaultPrice ?? this.defaultPrice,
        coursePrice: coursePrice ?? this.coursePrice,
        courseType: courseType ?? this.courseType,
        sectionType: sectionType ?? this.sectionType,
        visible: visible ?? this.visible,
        displayOrder: displayOrder ?? this.displayOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        tutorCourse: tutorCourse ?? this.tutorCourse,
      );

  @override
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      level: json['level'] as String?,
      reason: json['reason'] as String?,
      purpose: json['purpose'] as String?,
      otherDetails: json['otherDetails'] as String?,
      defaultPrice: json['defaultPrice'] as int?,
      coursePrice: json['coursePrice'] as int?,
      courseType: json['courseType'] as String?,
      sectionType: json['sectionType'] as String?,
      visible: json['visible'] as bool?,
      displayOrder: json['displayOrder'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      tutorCourse: json['tutorCourse'] == null
          ? null
          : TutorCourse.fromJson(json['tutorCourse'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'level': level,
      'reason': reason,
      'purpose': purpose,
      'otherDetails': otherDetails,
      'defaultPrice': defaultPrice,
      'coursePrice': coursePrice,
      'courseType': courseType,
      'sectionType': sectionType,
      'visible': visible,
      'displayOrder': displayOrder,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'tutorCourse': tutorCourse?.toJson(),
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        level,
        reason,
        purpose,
        otherDetails,
        defaultPrice,
        coursePrice,
        courseType,
        sectionType,
        visible,
        displayOrder,
        createdAt,
        updatedAt,
        tutorCourse,
      ];
}

class TutorCourse extends BaseModel {
  final String? userId;
  final String? courseId;
  final String? createdAt;
  final String? updatedAt;

  TutorCourse({
    this.userId,
    this.courseId,
    this.createdAt,
    this.updatedAt,
  });

  TutorCourse copyWith({
    String? userId,
    String? courseId,
    String? createdAt,
    String? updatedAt,
  }) =>
      TutorCourse(
        userId: userId ?? this.userId,
        courseId: courseId ?? this.courseId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  factory TutorCourse.fromJson(Map<String, dynamic> json) {
    return TutorCourse(
      userId: json['userId'] as String?,
      courseId: json['courseId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'courseId': courseId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        courseId,
        createdAt,
        updatedAt,
      ];
}
