import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class ContentCategoryRepository extends BaseRepository {
  ContentCategoryRepository() : super('/content-category');

  Future<DataState<ContentCategoryOutput>> getListContentCategory() async {
    return get<ContentCategoryOutput>(
      path: '',
      parseJsonFunction: ContentCategoryOutput.fromJson,
    );
  }
}