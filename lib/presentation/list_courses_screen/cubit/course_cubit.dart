import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/search_course_form.dart';
import 'package:lettutor/core/data_source/network/models/output/course_model.dart';
import 'package:lettutor/core/repository/content_category_repository/content_category_repository.dart';
import 'package:lettutor/core/repository/course_repository/course_repository.dart';
import 'package:lettutor/core/repository/ebook_repository/ebook_repository.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/list_courses_screen/cubit/courses_state.dart';

class CourseCubit extends WidgetCubit<CourseState> {
  CourseCubit()
      : super(
            initialState: const CourseState(),
            parseJsonFunction: CourseState.fromJson);

  @override
  Future<void> init() async {
    await getListCourses(SearchCourseForm(
      page: 1,
      size: 100,
    ));
    await getListCategories();
  }

  Future<void> getListCourses(SearchCourseForm input) async {
    showLoading();
    final response = await getIt<CourseRepository>().getListCourses(input);
    if (response is DataSuccess) {
      final courseList = response.data?.data?.rows;
      emit(state.copyWith(
          listCourses: courseList, isEmpty: courseList?.isEmpty ?? true));
    } else if (response is DataError) {
      emit(state.copyWith(isEmpty: true));
    }
    hideLoading();
  }

  Future<void> getListCategories() async {
    showLoading();
    final response =
        await getIt<ContentCategoryRepository>().getListContentCategory();
    if (response is DataSuccess) {
      final categoryList = response.data?.rows;
      emit(state.copyWith(listCategories: categoryList));
    } else if (response is DataError) {
      emit(state.copyWith(isEmpty: true));
    }
    hideLoading();
  }

  Future<void> getListEbook(SearchCourseForm input) async {
    showLoading();
    final response = await getIt<EbookRepository>().getListEbooks(input);
    if (response is DataSuccess) {
      final ebookList = response.data?.data?.rows;
      emit(state.copyWith(
          listEbooks: ebookList,
          currentEbookPage: input.page,
          totalEbookPage:
              ((response.data?.data?.count ?? 0) / (input.size ?? 1)).ceil(),
          perPageEbook: input.size));
    } else if (response is DataError) {
      emit(state.copyWith(isEmpty: true));
    }
    hideLoading();
  }

  Future<void> getDetailCourse(String id) async {
    showLoading();
    final response = await getIt<CourseRepository>().getDetailCourse(id);
    if (response is DataSuccess) {
      final course = response.data?.data;
      emit(state.copyWith(detailCourse: course));
    } else if (response is DataError) {
      emit(state.copyWith(isEmpty: true));
    }
    hideLoading();
  }

  Future<void> updatePage(int page) async {
    emit(state.copyWith(currentEbookPage: page));
  }

  Future<void> updateTopic(Topic? topic) async {
    emit(state.copyWith(currentTopic: topic));
  }
}
