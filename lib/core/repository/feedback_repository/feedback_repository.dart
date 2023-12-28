import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/output/feedback_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class FeedbackRepository extends BaseRepository{
  FeedbackRepository() : super('/feedback/v2');

  Future<DataState<FeedbackOutput>> getFeedback(
     String id, int index) async {
    return get<FeedbackOutput>(
      path: '/$id',
      parseJsonFunction: FeedbackOutput.fromJson,
      queryParameters: {
        'page': index,
        'perPage': '9',
      },
    );
  }
}