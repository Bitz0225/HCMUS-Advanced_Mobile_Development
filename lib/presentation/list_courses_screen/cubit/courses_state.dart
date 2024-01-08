import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class CourseState extends WidgetState {
  final List<CourseDataRow>? listCourses;
  final List<CourseCategory>? listCategories;
  final List<EbookRow>? listEbooks;
  final DetailCourseData? detailCourse;
  final Topic? currentTopic;
  final int? currentEbookPage;
  final int? totalEbookPage;
  final int? perPageEbook;
  final bool? isEmpty;

  const CourseState({
    this.listCourses,
    this.listCategories,
    this.listEbooks,
    this.detailCourse,
    this.currentTopic,
    this.currentEbookPage,
    this.totalEbookPage,
    this.perPageEbook,
    this.isEmpty,
  });

  @override
  List<Object?> get props => [
    listCourses,
    listCategories,
    listEbooks,
    detailCourse,
    currentTopic,
    currentEbookPage,
    totalEbookPage,
    perPageEbook,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'listCourses': listCourses,
      'listCategories': listCategories,
      'listEbooks': listEbooks,
      'detailCourse': detailCourse,
      'currentTopic': currentTopic,
      'currentEbookPage': currentEbookPage,
      'totalEbookPage': totalEbookPage,
      'perPageEbook': perPageEbook,
      'isEmpty': isEmpty,
    };
  }

  factory CourseState.fromJson(Map<String, dynamic> json) {
    return CourseState(
      listCourses: json['listCourses'] == null
          ? null
          : (json['listCourses'] as List<dynamic>)
              .map((e) => CourseDataRow.fromJson(e as Map<String, dynamic>))
              .toList(),
      listCategories: json['listCategories'] == null
          ? null
          : (json['listCategories'] as List<dynamic>)
              .map((e) => CourseCategory.fromJson(e as Map<String, dynamic>))
              .toList(),
      listEbooks: json['listEbooks'] == null
          ? null
          : (json['listEbooks'] as List<dynamic>)
              .map((e) => EbookRow.fromJson(e as Map<String, dynamic>))
              .toList(),
      detailCourse: json['detailCourse'] == null
          ? null
          : DetailCourseData.fromJson(
              json['detailCourse'] as Map<String, dynamic>),
      currentTopic: json['currentTopic'] == null
          ? null
          : Topic.fromJson(json['currentTopic'] as Map<String, dynamic>),
      currentEbookPage: json['currentEbookPage'] as int?,
      totalEbookPage: json['totalEbookPage'] as int?,
      perPageEbook: json['perPageEbook'] as int?,
      isEmpty: json['isEmpty'] as bool?,
    );
  }

  CourseState copyWith({
    List<CourseDataRow>? listCourses,
    List<CourseCategory>? listCategories,
    List<EbookRow>? listEbooks,
    DetailCourseData? detailCourse,
    Topic? currentTopic,
    int? currentEbookPage,
    int? totalEbookPage,
    int? perPageEbook,
    bool? isEmpty,
  }) {
    return CourseState(
      listCourses: listCourses ?? this.listCourses,
      listCategories: listCategories ?? this.listCategories,
      listEbooks: listEbooks ?? this.listEbooks,
      detailCourse: detailCourse ?? this.detailCourse,
      currentTopic: currentTopic ?? this.currentTopic,
      currentEbookPage: currentEbookPage ?? this.currentEbookPage,
      totalEbookPage: totalEbookPage ?? this.totalEbookPage,
      perPageEbook: perPageEbook ?? this.perPageEbook,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
