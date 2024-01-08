import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class ScheduleRepository extends BaseRepository {
  ScheduleRepository() : super('/schedule');

  Future<DataState<ScheduleOutput>> getScheduleOfTutor(String tutorId, int page) async {
    return get<ScheduleOutput>(
      path: '',
      queryParameters: {'tutorId': tutorId, 'page': page},
      parseJsonFunction: ScheduleOutput.fromJson,
    );
  }
}
