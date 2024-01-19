import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/report_history_input_form.dart';
import 'package:lettutor/core/data_source/network/models/output/schedule_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class LessonReportRepository extends BaseRepository {
  LessonReportRepository() : super('/lesson-report');

  Future<DataState<ReportHistoryOutput>> reportHistory(
      ReportHistoryInputForm input) async {
    return put<ReportHistoryOutput>(
        path: '/save-report',
        data: input.toJson(),
        parseJsonFunction: ReportHistoryOutput.fromJson);
  }
}
