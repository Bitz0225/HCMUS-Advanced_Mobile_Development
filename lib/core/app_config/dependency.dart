import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/core/network/network_manager.dart';
import 'package:lettutor/core/repository/auth_repository/auth_repository.dart';
import 'package:lettutor/core/repository/content_category_repository/content_category_repository.dart';
import 'package:lettutor/core/repository/course_repository/course_repository.dart';
import 'package:lettutor/core/repository/ebook_repository/ebook_repository.dart';
import 'package:lettutor/core/repository/feedback_repository/feedback_repository.dart';
import 'package:lettutor/core/repository/report_repository/report_repository.dart';
import 'package:lettutor/core/repository/schedule_repository/schedule_repository.dart';
import 'package:lettutor/core/repository/tutor_repository/tutor_repository.dart';
import 'package:lettutor/core/repository/user_repository/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  getIt
    ..registerSingletonAsync<LocalStorage>(LocalStorage.init)
    ..registerSingleton<NetworkManager>(NetworkManager.initial())
    ..registerLazySingleton<AuthRepository>(AuthRepository.new)
    ..registerLazySingleton<TutorRepository>(TutorRepository.new)
    ..registerLazySingleton<UserRepository>(UserRepository.new)
    ..registerLazySingleton<FeedbackRepository>(FeedbackRepository.new)
    ..registerLazySingleton<ReportRepository>(ReportRepository.new)
    ..registerLazySingleton<CourseRepository>(CourseRepository.new)
    ..registerLazySingleton<EbookRepository>(EbookRepository.new)
    ..registerLazySingleton<ContentCategoryRepository>(
        ContentCategoryRepository.new)
    ..registerLazySingleton<ScheduleRepository>(ScheduleRepository.new);
}
