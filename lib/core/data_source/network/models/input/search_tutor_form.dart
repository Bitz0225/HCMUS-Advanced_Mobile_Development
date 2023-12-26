import 'package:lettutor/core/data_source/network/models/base_model.dart';

class SearchTutorForm extends BaseModel {
  final String? page;
  final int? perPage;
  final Filter? filters;
  final String? search;

  const SearchTutorForm({this.page, this.perPage, this.filters, this.search});

  @override
  // TODO: implement props
  List<Object?> get props => [page, perPage, filters, search];

  @override
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'perPage': perPage,
      'filters': filters?.toJson() ?? {
        'date': null,
        'nationality': {},
        'specialities': [],
        'tutoringTimeAvailable': [null, null],
      },
      'search': search ?? '',
    };
  }

  SearchTutorForm copyWith({
    String? page,
    int? perPage,
    Filter? filters,
    String? search,
  }) {
    return SearchTutorForm(
      page: page ?? this.page,
      perPage: perPage ?? this.perPage,
      filters: filters ?? this.filters,
      search: search ?? this.search,
    );
  }

  factory SearchTutorForm.fromJson(Map<String, dynamic> json) {
    return SearchTutorForm(
      page: json['page'] as String?,
      perPage: json['perPage'] as int?,
      filters: json['filters'] != null
          ? Filter.fromJson(json['filters'] as Map<String, dynamic>)
          : null,
      search: json['search'] as String?,
    );
  }
}

class Filter extends BaseModel {
  final String? date;
  final NationalityCheck? nationality;
  final List<String>? specialities;
  final List<int>? tutoringTimeAvailable;

  const Filter(
      {this.date,
      this.nationality,
      this.specialities,
      this.tutoringTimeAvailable});

  @override
  // TODO: implement props
  List<Object?> get props => [
        date,
        nationality,
        specialities,
        tutoringTimeAvailable,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'nationality': nationality?.toJson() ?? {},
      'specialties': specialities ?? [],
      'tutoringTimeAvailable': tutoringTimeAvailable ?? [],
    };
  }

  Filter copyWith(
      {String? date,
      NationalityCheck? nationality,
      List<String>? specialities,
      List<int>? tutoringTimeAvailable}) {
    return Filter(
      date: date ?? this.date,
      nationality: nationality ?? this.nationality,
      specialities: specialities ?? this.specialities,
      tutoringTimeAvailable:
          tutoringTimeAvailable ?? this.tutoringTimeAvailable,
    );
  }

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      date: json['date'] as String?,
      nationality: json['nationality'] != null
          ? NationalityCheck.fromJson(
              json['nationality'] as Map<String, dynamic>)
          : null,
      specialities: (json['specialities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tutoringTimeAvailable: (json['tutoringTimeAvailable'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );
  }
}

class NationalityCheck extends BaseModel {
  final bool? isNative;
  final bool? isVietnamese;

  const NationalityCheck({this.isNative, this.isVietnamese});

  @override
  List<Object?> get props => [
        isNative,
        isVietnamese,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'isNative': isNative,
      'isVietnamese': isVietnamese,
    };
  }

  //copyWith
  NationalityCheck copyWith({
    bool? isNative,
    bool? isVietnamese,
  }) {
    return NationalityCheck(
      isNative: isNative ?? this.isNative,
      isVietnamese: isVietnamese ?? this.isVietnamese,
    );
  }

  factory NationalityCheck.fromJson(Map<String, dynamic> json) {
    return NationalityCheck(
      isNative: json['isNative'] as bool?,
      isVietnamese: json['isVietnamese'] as bool?,
    );
  }
}
