class SearchCourseForm {
  final int? page;
  final int? size;
  final String? query;

  SearchCourseForm({this.page, this.size, this.query});

  factory SearchCourseForm.fromJson(Map<String, dynamic> json) {
    return SearchCourseForm(
      page: json['page'] as int?,
      size: json['size'] as int?,
      query: json['query'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'size': size,
      'q': query,
    };
  }

  SearchCourseForm copyWith({
    int? page,
    int? size,
    String? query,
  }) {
    return SearchCourseForm(
      page: page ?? this.page,
      size: size ?? this.size,
      query: query ?? this.query,
    );
  }
}
