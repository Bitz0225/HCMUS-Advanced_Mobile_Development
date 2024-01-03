import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/search_course_form.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class CourseRepository extends BaseRepository {
  CourseRepository() : super('/course');

  Future<DataState<ListCoursesOutput>> getListCourses(SearchCourseForm input) async {
    return get<ListCoursesOutput>(
      path: '',
      parseJsonFunction: ListCoursesOutput.fromJson,
      queryParameters: input.toJson(),
    );
  }
}
