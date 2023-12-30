import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/report_form_input.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class ReportRepository extends BaseRepository {
  ReportRepository() : super('/report');

  Future<DataState<ReportOutput>> sendReport(
      ReportFormInput input) async {
    return post<ReportOutput>(
      path: '',
      parseJsonFunction: ReportOutput.fromJson,
      data: input.toJson(),
    );
  }
}