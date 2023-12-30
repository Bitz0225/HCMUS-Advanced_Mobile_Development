import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/report_form_input.dart';
import 'package:lettutor/core/data_source/network/models/input/search_tutor_form.dart';
import 'package:lettutor/core/data_source/network/models/output/tutor_model.dart';
import 'package:lettutor/core/repository/feedback_repository/feedback_repository.dart';
import 'package:lettutor/core/repository/report_repository/report_repository.dart';
import 'package:lettutor/core/repository/tutor_repository/tutor_repository.dart';
import 'package:lettutor/core/repository/user_repository/user_repository.dart';
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
  }

  Future<void> updateFavoriteState(String id) async {
    final response = await getIt<UserRepository>().updateFavoriteTutor(id);
    if (response is DataSuccess) {
      final tutorList = state.tutorList;
      if (tutorList != null) {
        final index = tutorList.indexWhere((element) => element.id == id);
        if (index != -1) {
          final _tutor = tutorList[index].copyWith(
              isFavoriteTutor: !(tutorList[index].isFavoriteTutor ?? false));
          tutorList[index] = _tutor;
          emit(state.copyWith(tutorList: tutorList));
          showSnackBar('Update favorite teacher successfully!',
              snackBarType: SnackBarType.success);
        }
      }
    } else {
      showSnackBar('Error when trying to update favorite state!');
    }
  }

  Future<void> getDetailTutor(String id) async {
    showLoading();
    final response = await getIt<TutorRepository>().getDetailTutor(id);
    if (response is DataSuccess) {
      final tutor = response.data;
      if (tutor != null) {
        emit(state.copyWith(currentDetailTutor: tutor));
      }
    } else {
      showSnackBar('Error when trying to get detail tutor!');
    }
    hideLoading();
  }

  Future<void> getFeedback(String id, int index) async {
    showLoading();
    final response = await getIt<FeedbackRepository>().getFeedback(id, index);
    if (response is DataSuccess) {
      final feedback = response.data;
      if (feedback != null) {
        final totalFeedbackPage =
            ((feedback.data?.count ?? 0) / state.perPage).ceil();
        final currentFeedbackPageAmount = feedback.data?.rows?.length;
        final currentFeedbackPage = index;
        emit(state.copyWith(
            feedbackOutput: feedback,
            totalFeedbackPages: totalFeedbackPage,
            currentFeedbackPageAmount: currentFeedbackPageAmount,
            currentFeedbackPage: currentFeedbackPage));
      }
    } else {
      showSnackBar('Error when trying to get feedback!');
    }
    hideLoading();
  }

  Future<void> updateFeedbackPage(int index) async {
    emit(state.copyWith(currentFeedbackPage: index));
  }

  Future<void> reportTutor({required String content, required String tutorId}) async {
    showLoading();
    final formInput = ReportFormInput(content: content, id: tutorId);
    final response = await getIt<ReportRepository>().sendReport(formInput);
    hideLoading();
    if (response is DataSuccess) {
      showSnackBar('Report successfully!', snackBarType: SnackBarType.success);
    } else {
      showSnackBar('Error when trying to report!');
    }
  }
}
