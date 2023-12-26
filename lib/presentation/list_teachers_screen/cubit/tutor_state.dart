import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class TutorState extends WidgetState {
  final int? totalPages;
  final int? currentPageAmount;
  final int perPage;
  final int? currentPage;
  final bool? isEmpty;
  final String? tag;
  final List<TutorSearchOutputItem>? tutorList;

  const TutorState(
      {this.totalPages,
        this.currentPageAmount,
      this.currentPage = 1,
      this.perPage = 9,
      this.tag,
      this.isEmpty = true,
      this.tutorList});

  @override
  List<Object?> get props => [
        totalPages,
    tag,
        currentPage,
        currentPageAmount,
        perPage,
        tutorList,
        isEmpty,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory TutorState.fromJson(Map<String, dynamic> json) {
    return TutorState(
      totalPages: json['totalPages'] as int?,
      currentPage: json['currentPage'] as int?,
      currentPageAmount: json['currentPageAmount'] as int?,
      perPage: json['perPage'] as int,
      tag: json['tag'] as String?,
      isEmpty: json['isEmpty'] as bool?,
      tutorList: json['tutorList'] != null
          ? (json['tutorList'] as List)
              .map((e) => TutorSearchOutputItem.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
    );
  }

  TutorState copyWith({
    int? totalPages,
    int? currentPage,
    int? perPage,
    int? currentPageAmount,
    String? tag,
    bool? isEmpty,
    List<TutorSearchOutputItem>? tutorList,
  }) {
    return TutorState(
      totalPages: totalPages ?? this.totalPages,
      currentPage: currentPage ?? this.currentPage,
      currentPageAmount: currentPageAmount ?? this.currentPageAmount,
      perPage: perPage ?? this.perPage,
      tag: tag ?? this.tag,
      tutorList: tutorList ?? this.tutorList,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }
}
