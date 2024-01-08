import 'package:lettutor/core/data_source/network/models/base_model.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/presentation/list_courses_screen/widget/course_overview.dart';

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

  const Course({
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

class ListCoursesOutput extends BaseModel {
  final String? message;
  final ListCoursesData? data;

  const ListCoursesOutput({
    this.message,
    this.data,
  });

  ListCoursesOutput copyWith({
    String? message,
    ListCoursesData? data,
  }) =>
      ListCoursesOutput(
        message: message ?? this.message,
        data: data ?? this.data,
      );

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
      'data': data?.toJson(),
    };
  }

  factory ListCoursesOutput.fromJson(Map<String, dynamic> json) {
    return ListCoursesOutput(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ListCoursesData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class ListCoursesData extends BaseModel {
  final int? count;
  final List<CourseDataRow>? rows;

  const ListCoursesData({
    this.count,
    this.rows,
  });

  ListCoursesData copyWith({
    int? count,
    List<CourseDataRow>? rows,
  }) =>
      ListCoursesData(
        count: count ?? this.count,
        rows: rows ?? this.rows,
      );

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
      'rows': rows?.map((x) => x.toJson()).toList(),
    };
  }

  factory ListCoursesData.fromJson(Map<String, dynamic> json) {
    return ListCoursesData(
      count: json['count'] as int?,
      rows: json['rows'] == null
          ? null
          : (json['rows'] as List<dynamic>)
              .map((e) => CourseDataRow.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class CourseDataRow extends BaseModel {
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
  final int? displayOrder;
  final String? createdAt;
  final String? updatedAt;
  final List<Topic>? topics;
  final List<CourseCategory>? categories;

  const CourseDataRow({
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
    this.topics,
    this.categories,
  });

  CourseDataRow copyWith({
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
    int? displayOrder,
    String? createdAt,
    String? updatedAt,
    List<Topic>? topics,
    List<CourseCategory>? categories,
  }) =>
      CourseDataRow(
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
        topics: topics ?? this.topics,
        categories: categories ?? this.categories,
      );

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
        topics,
        categories,
      ];


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
      'topics': topics?.map((x) => x.toJson()).toList(),
      'categories': categories?.map((x) => x.toJson()).toList(),
    };
  }

  factory CourseDataRow.fromJson(Map<String, dynamic> json) {
    return CourseDataRow(
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
      displayOrder: json['displayOrder'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      topics: json['topics'] == null
          ? null
          : (json['topics'] as List<dynamic>)
              .map((e) => Topic.fromJson(e as Map<String, dynamic>))
              .toList(),
      categories: json['categories'] == null
          ? null
          : (json['categories'] as List<dynamic>)
              .map((e) => CourseCategory.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class CourseCategory extends BaseModel {
  final String? id;
  final String? title;
  final String? description;
  final String? key;
  final int? displayOrder;
  final String? createdAt;
  final String? updatedAt;

  const CourseCategory({
    this.id,
    this.title,
    this.description,
    this.key,
    this.displayOrder,
    this.createdAt,
    this.updatedAt,
  });

  CourseCategory copyWith({
    String? id,
    String? title,
    String? description,
    String? key,
    int? displayOrder,
    String? createdAt,
    String? updatedAt,
  }) =>
      CourseCategory(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        key: key ?? this.key,
        displayOrder: displayOrder ?? this.displayOrder,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        description,
        key,
        displayOrder,
        createdAt,
        updatedAt,
      ];


  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'key': key,
      'displayOrder': displayOrder,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CourseCategory.fromJson(Map<String, dynamic> json) {
    return CourseCategory(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      key: json['key'] as String?,
      displayOrder: json['displayOrder'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }
}

class Topic extends BaseModel {
  final String? id;
  final String? courseId;
  final int? orderCourse;
  final String? name;
  final String? beforeTheClassNotes;
  final String? afterTheClassNotes;
  final String? nameFile;
  final int? numberOfPages;
  final String? description;
  final String? videoUrl;
  final String? type;
  final String? createdAt;
  final String? updatedAt;

  const Topic({
    this.id,
    this.courseId,
    this.orderCourse,
    this.name,
    this.beforeTheClassNotes,
    this.afterTheClassNotes,
    this.nameFile,
    this.numberOfPages,
    this.description,
    this.videoUrl,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  Topic copyWith({
    String? id,
    String? courseId,
    int? orderCourse,
    String? name,
    String? beforeTheClassNotes,
    String? afterTheClassNotes,
    String? nameFile,
    int? numberOfPages,
    String? description,
    String? videoUrl,
    String? type,
    String? createdAt,
    String? updatedAt,
  }) =>
      Topic(
        id: id ?? this.id,
        courseId: courseId ?? this.courseId,
        orderCourse: orderCourse ?? this.orderCourse,
        name: name ?? this.name,
        beforeTheClassNotes: beforeTheClassNotes ?? this.beforeTheClassNotes,
        afterTheClassNotes: afterTheClassNotes ?? this.afterTheClassNotes,
        nameFile: nameFile ?? this.nameFile,
        numberOfPages: numberOfPages ?? this.numberOfPages,
        description: description ?? this.description,
        videoUrl: videoUrl ?? this.videoUrl,
        type: type ?? this.type,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        courseId,
        orderCourse,
        name,
        beforeTheClassNotes,
        afterTheClassNotes,
        nameFile,
        numberOfPages,
        description,
        videoUrl,
        type,
        createdAt,
        updatedAt,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'orderCourse': orderCourse,
      'name': name,
      'beforeTheClassNotes': beforeTheClassNotes,
      'afterTheClassNotes': afterTheClassNotes,
      'nameFile': nameFile,
      'numberOfPages': numberOfPages,
      'description': description,
      'videoUrl': videoUrl,
      'type': type,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
      id: json['id'] as String?,
      courseId: json['courseId'] as String?,
      orderCourse: json['orderCourse'] as int?,
      name: json['name'] as String?,
      beforeTheClassNotes: json['beforeTheClassNotes'] as String?,
      afterTheClassNotes: json['afterTheClassNotes'] as String?,
      nameFile: json['nameFile'] as String?,
      numberOfPages: json['numberOfPages'] as int?,
      description: json['description'] as String?,
      videoUrl: json['videoUrl'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }
}

class ListEbookOutput extends BaseModel {
  final String? message;
  final ListEbooksData? data;

  const ListEbookOutput({
    this.message,
    this.data,
  });

  ListEbookOutput copyWith({
    String? message,
    ListEbooksData? data,
  }) =>
      ListEbookOutput(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  @override
  List<Object?> get props => [
        message,
        data,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'data': data?.toJson(),
    };
  }

  factory ListEbookOutput.fromJson(Map<String, dynamic> json) {
    return ListEbookOutput(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ListEbooksData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class ListEbooksData extends BaseModel {
  final int? count;
  final List<EbookRow>? rows;

  const ListEbooksData({
    this.count,
    this.rows,
  });

  ListEbooksData copyWith({
    int? count,
    List<EbookRow>? rows,
  }) =>
      ListEbooksData(
        count: count ?? this.count,
        rows: rows ?? this.rows,
      );

  @override
  List<Object?> get props => [
        count,
        rows,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'rows': rows?.map((x) => x.toJson()).toList(),
    };
  }

  factory ListEbooksData.fromJson(Map<String, dynamic> json) {
    return ListEbooksData(
      count: json['count'] as int?,
      rows: json['rows'] == null
          ? null
          : (json['rows'] as List<dynamic>)
              .map((e) => EbookRow.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class EbookRow extends BaseModel {
  final String? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? level;
  final bool? visible;
  final String? fileUrl;
  final String? createdAt;
  final String? updatedAt;
  final bool? isPrivate;
  final String? createdBy;
  final List<CourseCategory>? categories;

  const EbookRow({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.level,
    this.visible,
    this.fileUrl,
    this.createdAt,
    this.updatedAt,
    this.isPrivate,
    this.createdBy,
    this.categories,
  });

  EbookRow copyWith({
    String? id,
    String? name,
    String? description,
    String? imageUrl,
    String? level,
    bool? visible,
    String? fileUrl,
    String? createdAt,
    String? updatedAt,
    bool? isPrivate,
    String? createdBy,
    List<CourseCategory>? categories,
  }) =>
      EbookRow(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
        level: level ?? this.level,
        visible: visible ?? this.visible,
        fileUrl: fileUrl ?? this.fileUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isPrivate: isPrivate ?? this.isPrivate,
        createdBy: createdBy ?? this.createdBy,
        categories: categories ?? this.categories,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        level,
        visible,
        fileUrl,
        createdAt,
        updatedAt,
        isPrivate,
        createdBy,
        categories,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'level': level,
      'visible': visible,
      'fileUrl': fileUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'isPrivate': isPrivate,
      'createdBy': createdBy,
      'categories': categories?.map((x) => x.toJson()).toList(),
    };
  }

  factory EbookRow.fromJson(Map<String, dynamic> json) {
    return EbookRow(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      imageUrl: json['imageUrl'] as String?,
      level: json['level'] as String?,
      visible: json['visible'] as bool?,
      fileUrl: json['fileUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isPrivate: json['isPrivate'] as bool?,
      createdBy: json['createdBy'] as String?,
      categories: json['categories'] == null
          ? null
          : (json['categories'] as List<dynamic>)
              .map((e) => CourseCategory.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }
}

class ContentCategoryOutput extends BaseModel {
  final int? count;
  final List<CourseCategory>? rows;

  const ContentCategoryOutput({
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
      'rows': rows?.map((x) => x.toJson()).toList(),
    };
  }

  factory ContentCategoryOutput.fromJson(Map<String, dynamic> json) {
    return ContentCategoryOutput(
      count: json['count'] as int?,
      rows: json['rows'] == null
          ? null
          : (json['rows'] as List<dynamic>)
          .map((e) => CourseCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  ContentCategoryOutput copyWith({
    int? count,
    List<CourseCategory>? rows,
  }) =>
      ContentCategoryOutput(
        count: count ?? this.count,
        rows: rows ?? this.rows,
      );
}

class DetailCourseOutput extends BaseModel {
  final String? message;
  final DetailCourseData? data;

  const DetailCourseOutput({
    this.message,
    this.data,
  });

  DetailCourseOutput copyWith({
    String? message,
    DetailCourseData? data,
  }) =>
      DetailCourseOutput(
        message: message ?? this.message,
        data: data ?? this.data,
      );

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
      'data': data?.toJson(),
    };
  }

  factory DetailCourseOutput.fromJson(Map<String, dynamic> json) {
    return DetailCourseOutput(
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DetailCourseData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class DetailCourseData extends BaseModel {
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
  final int? displayOrder;
  final String? createdAt;
  final String? updatedAt;
  final List<Topic>? topics;
  final List<TutorRecommend>? users;

  const DetailCourseData({
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
    this.topics,
    this.users,
  });

  CourseDataRow getCourseData() {
    return CourseDataRow(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      level: level,
      reason: reason,
      purpose: purpose,
      otherDetails: otherDetails,
      defaultPrice: defaultPrice,
      coursePrice: coursePrice,
      courseType: courseType,
      sectionType: sectionType,
      visible: visible,
      displayOrder: displayOrder,
      createdAt: createdAt,
      updatedAt: updatedAt,
      topics: topics,
    );
  }

  DetailCourseData copyWith({
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
    int? displayOrder,
    String? createdAt,
    String? updatedAt,
    List<Topic>? topics,
    List<TutorRecommend>? users,
  }) =>
      DetailCourseData(
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
        topics: topics ?? this.topics,
        users: users ?? this.users,
      );

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
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
        topics,
        users,
      ];

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
      'topics': topics?.map((x) => x.toJson()).toList(),
      'users': users?.map((x) => x.toJson()).toList(),
    };
  }

  factory DetailCourseData.fromJson(Map<String, dynamic> json) {
    return DetailCourseData(
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
      displayOrder: json['displayOrder'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      topics: json['topics'] == null
          ? null
          : (json['topics'] as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: json['users'] == null
          ? null
          : (json['users'] as List<dynamic>)
          .map((e) => TutorRecommend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class TutorRecommend extends BaseModel {
  final String? id;
  final String? level;
  final String? email;
  final String? google;
  final String? facebook;
  final String? apple;
  final String? password;
  final String? avatar;
  final String? name;
  final String? country;
  final String? phone;
  final String? language;
  final String? birthday;
  final bool? requestPassword;
  final bool? isActivated;
  final bool? isPhoneActivated;
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
  final TutorCourse? tutorCourse;

  const TutorRecommend({
    this.id,
    this.level,
    this.email,
    this.google,
    this.facebook,
    this.apple,
    this.password,
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
    this.tutorCourse,
  });

  TutorRecommend copyWith({
    String? id,
    String? level,
    String? email,
    String? google,
    String? facebook,
    String? apple,
    String? password,
    String? avatar,
    String? name,
    String? country,
    String? phone,
    String? language,
    String? birthday,
    bool? requestPassword,
    bool? isActivated,
    bool? isPhoneActivated,
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
    TutorCourse? tutorCourse,
  }) =>
      TutorRecommend(
        id: id ?? this.id,
        level: level ?? this.level,
        email: email ?? this.email,
        google: google ?? this.google,
        facebook: facebook ?? this.facebook,
        apple: apple ?? this.apple,
        password: password ?? this.password,
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
        tutorCourse: tutorCourse ?? this.tutorCourse,
      );

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        level,
        email,
        google,
        facebook,
        apple,
        password,
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
        tutorCourse,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'level': level,
      'email': email,
      'google': google,
      'facebook': facebook,
      'apple': apple,
      'password': password,
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
      'tutorCourse': tutorCourse?.toJson(),
    };
  }

  factory TutorRecommend.fromJson(Map<String, dynamic> json) {
    return TutorRecommend(
      id: json['id'] as String?,
      level: json['level'] as String?,
      email: json['email'] as String?,
      google: json['google'] as String?,
      facebook: json['facebook'] as String?,
      apple: json['apple'] as String?,
      password: json['password'] as String?,
      avatar: json['avatar'] as String?,
      name: json['name'] as String?,
      country: json['country'] as String?,
      phone: json['phone'] as String?,
      language: json['language'] as String?,
      birthday: json['birthday'] as String?,
      requestPassword: json['requestPassword'] as bool?,
      isActivated: json['isActivated'] as bool?,
      isPhoneActivated: json['isPhoneActivated'] as bool?,
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
      tutorCourse: json['tutorCourse'] == null
          ? null
          : TutorCourse.fromJson(json['tutorCourse'] as Map<String, dynamic>),
    );
  }
}
