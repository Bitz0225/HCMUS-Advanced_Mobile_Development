import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/search_tutor_form.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/core/repository/base_repository.dart';

class TutorRepository extends BaseRepository {
  TutorRepository() : super('/tutor');

  Future<DataState<TutorSearchOutput>> searchTutor(SearchTutorForm input) async {
    return post<TutorSearchOutput>(
      path: '/search',
      parseJsonFunction: TutorSearchOutput.fromJson,
      data: input.toJson(),
    );
  }
}
