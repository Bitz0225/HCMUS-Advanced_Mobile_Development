import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/base_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class CallRepository extends BaseRepository {
  CallRepository() : super('/call');

  Future<DataState<TotalLearningTime>> getTotalLearningTime() async {
    return get<TotalLearningTime>(
      path: '/total',
      parseJsonFunction: TotalLearningTime.fromJson,
    );
  }
}

class TotalLearningTime extends BaseModel {
  final int? total;

  const TotalLearningTime({this.total});

  @override
  // TODO: implement props
  List<Object?> get props => [total];
  @override
  Map<String, dynamic> toJson() {
    return {
      'total': total,
    };
  }

  factory TotalLearningTime.fromJson(Map<String, dynamic> json) => TotalLearningTime(
    total: json['total'] as int?,
  );

  TotalLearningTime copyWith({
    int? total,
  }) {
    return TotalLearningTime(
      total: total ?? this.total,
    );
  }
}
