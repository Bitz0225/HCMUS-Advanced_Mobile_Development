import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/search_tutor_form.dart';
import 'package:lettutor/core/repository/tutor_repository/tutor_repository.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/list_teachers_screen/cubit/tutor_state.dart';

class TutorCubit extends WidgetCubit<TutorState> {
  TutorCubit()
      : super(
            initialState: const TutorState(),
            parseJsonFunction: TutorState.fromJson);

  @override
  Future<void> init() async {
    await getListTutorWithPagination(SearchTutorForm(
      page: state.currentPage.toString(),
      perPage: state.perPage,
    ));
  }

  Future<void> getListTutorWithPagination(SearchTutorForm input) async {
    showLoading();
    final result = await getIt<TutorRepository>().searchTutor(input);
    if (result is DataSuccess) {
      emit(state.copyWith(
        totalPages: ((result.data?.count ?? 0) / state.perPage).ceil(),
        tutorList: result.data?.rows,
        currentPageAmount: result.data?.rows?.length,
        isEmpty: false,
      ));
    } else if (result is DataError) {
      emit(state.copyWith(isEmpty: true));
    }
    hideLoading();
  }

  Future<void> updatePage(int index) async {
    emit(state.copyWith(currentPage: index));
  }

  Future<void> updateTags(String tag) async {
    emit(state.copyWith(tag: tag));
    print(state.tag);
  }
}
