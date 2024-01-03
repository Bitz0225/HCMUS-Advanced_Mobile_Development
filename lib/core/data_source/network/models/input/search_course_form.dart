class SearchCourseForm {
  final int? page;
  final int? perPage;
  final String? query;

  SearchCourseForm({this.page, this.perPage, this.query});

  factory SearchCourseForm.fromJson(Map<String, dynamic> json) {
    return SearchCourseForm(
      page: json['page'] as int?,
      perPage: json['perPage'] as int?,
      query: json['query'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'q': query,
    };
  }

  SearchCourseForm copyWith({
    int? page,
    int? perPage,
    String? query,
  }) {
    return SearchCourseForm(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      query: query ?? this.query,
    );
  }
}
