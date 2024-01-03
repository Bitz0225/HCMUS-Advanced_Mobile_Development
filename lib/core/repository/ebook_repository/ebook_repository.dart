import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/search_course_form.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class EbookRepository extends BaseRepository {
  EbookRepository() : super('/e-book');

  Future<DataState<ListEbookOutput>> getListEbooks(SearchCourseForm input) async {
    return get<ListEbookOutput>(
      path: '',
      parseJsonFunction: ListEbookOutput.fromJson,
      queryParameters: input.toJson(),
    );
  }
}