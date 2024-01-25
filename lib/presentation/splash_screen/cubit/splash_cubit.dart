import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/common/multipart_file_extended.dart';
import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/common/values/fixed_enum.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/failure_model.dart';
import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
import 'package:lettutor/core/data_source/network/models/input/update_password_form.dart';
import 'package:lettutor/core/data_source/network/models/input/update_profile_form.dart';
import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/network/network_manager.dart';
import 'package:lettutor/core/repository/auth_repository/auth_repository.dart';
import 'package:lettutor/core/repository/booking_repository/booking_repository.dart';
import 'package:lettutor/core/repository/call_repository/call_repository.dart';
import 'package:lettutor/core/repository/feedback_repository/feedback_repository.dart';
import 'package:lettutor/core/repository/user_repository/user_repository.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/lettutor_app/lettutor_app.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends WidgetCubit<SplashState> {
  SplashCubit()
      : super(
            initialState: const SplashState(),
            parseJsonFunction: SplashState.fromJson);

  final _userRepository = getIt.get<UserRepository>();
  final _authRepository = getIt.get<AuthRepository>();
  final _localStorage = getIt.get<LocalStorage>();
  final _feedbackRepository = getIt.get<FeedbackRepository>();
  final _bookingRepository = getIt.get<BookingRepository>();
  final _callRepository = getIt.get<CallRepository>();

  @override
  Future<void> init() async {
    await _handleInitial();
  }

  Future<void> _handleInitial() async {
    final accessToken = _localStorage.getString(
      key: StorageKey.accessToken,
    );

    if (accessToken == null) {
      emit(state.copyWith(isLogin: false));
    } else {
      getIt.get<NetworkManager>().updateHeader(accessToken: accessToken);
      emit(state.copyWith(isLogin: true));
    }
  }

  Future<void> getUser() async {
    final accessToken = _localStorage.getString(
      key: StorageKey.accessToken,
    );

    if (accessToken != null) {
      final user = await _userRepository.getUser();
      if (user is DataSuccess) {
        emit(state.copyWith(user: user.data?.user));
      } else {
        emit(state.copyWith(isLogin: false));
      }
    }
  }

  Future<void> updatePassword(String oldPassword, String newPassword) async {
    showLoading();
    final _form = ChangePasswordForm()
        .copyWith(oldPassword: oldPassword, newPassword: newPassword);
    final response = await _authRepository.updatePassword(
      _form,
    );
    if (response is DataSuccess) {
      emit(state.copyWith(passwordFormMessage: response.data?.message));
    } else {
      emit(state.copyWith(
          passwordFormMessage:
              response.error?.response?.data['message'] as String? ?? ''));
    }
    hideLoading();
    showSnackBar(
      state.passwordFormMessage ?? '',
      snackBarType: (state.passwordFormMessage?.contains('success') ?? false)
          ? SnackBarType.success
          : SnackBarType.error,
    );
  }

  Future<void> updateLearnTopics(Subject item) async {
    final _learningTopics = [...state.user?.learnTopics ?? []];
    final isExist =
        _learningTopics.where((element) => element.id == item.key).isNotEmpty;
    if (!isExist) {
      _learningTopics.add(TestPreparation()
          .copyWith(id: item.key, key: item.value, name: item.tagName));
    } else {
      _learningTopics.removeWhere((element) => element.id == item.key);
    }
    final _user = state.user?.copyWith(learnTopics: [..._learningTopics]);
    emit(state.copyWith(user: _user));
  }

  Future<void> getOwnFeedBack(int page) async {
    final response =
        await _feedbackRepository.getFeedback(state.user?.id ?? '', page);
    if (response is DataSuccess) {
      emit(state.copyWith(
          totalFeedbackPages: ((response.data?.data?.count ?? 0) / 9).ceil(),
          listFeedbacks: response.data?.data?.rows));
    } else {
      emit(state.copyWith(
          message: response.error?.response?.data['message'] as String? ?? ''));
    }
  }

  Future<void> getNext() async {
    showLoading();
    final response = await _bookingRepository.getNext();
    if (response is DataSuccess) {
      emit(state.copyWith(nextSchedule: response.data?.data?.first));
    } else {
      emit(state.copyWith(
          message: response.error?.response?.data['message'] as String? ?? ''));
    }
    hideLoading();
  }

  Future<void> updateTestPreparations(Test item) async {
    final _testPreparations = [...state.user?.testPreparations ?? []];
    final isExist =
        _testPreparations.where((element) => element.id == item.key).isNotEmpty;
    if (!isExist) {
      _testPreparations.add(TestPreparation()
          .copyWith(id: item.key, key: item.value, name: item.tagName));
    } else {
      _testPreparations.removeWhere((element) => element.id == item.key);
    }
    final _user =
        state.user?.copyWith(testPreparations: [..._testPreparations]);
    emit(state.copyWith(user: _user));
  }

  Future<void> updateProfile(UpdateProfileForm form) async {
    showLoading();
    final response = await _userRepository.updateProfile(form);
    if (response is DataSuccess) {
      final _user = state.user?.copyWith(
          name: response.data?.user?.name,
          country: response.data?.user?.country,
          birthday: response.data?.user?.birthday,
          level: response.data?.user?.level,
          learnTopics: response.data?.user?.learnTopics,
          testPreparations: response.data?.user?.testPreparations);
      emit(state.copyWith(user: _user, isProfileUpdateSuccess: true));
    } else {
      emit(state.copyWith(
          updateProfileFormMessage:
              response.error?.response?.data['message'] as String? ?? '',
          isProfileUpdateSuccess: false));
    }
    hideLoading();
  }

  Future<void> updateLevel(Level level) async {
    final _user = state.user?.copyWith(level: level.value);
    emit(state.copyWith(user: _user));
  }

  Future<void> getTotalLearningTime() async {
    showLoading();
    final response = await _callRepository.getTotalLearningTime();
    if (response is DataSuccess) {
      emit(state.copyWith(totalLearningTime: response.data?.total));
    } else {
      emit(state.copyWith(
          message: response.error?.response?.data['message'] as String? ?? ''));
    }
    hideLoading();
  }

  Future<void> updateAvatar(String path) async {
    showLoading();
    final formData = FormData.fromMap({
      'avatar': await MultipartFile.fromFile(path,
          contentType: MediaType('image', 'png')),
    });
    final response = await _userRepository.uploadImage(formData);
    if (response is DataSuccess) {
      final avatar = response.data?.avatar;
      final _user = state.user?.copyWith(avatar: avatar);
      emit(state.copyWith(user: _user));
    } else {
      emit(state.copyWith(
          message: response.error?.response?.data['message'] as String? ?? ''));
    }
    hideLoading();
  }

  Future<void> logout() async {
    await _localStorage.clear();
    await getIt.get<NetworkManager>().init();
    emit(state.copyWith(isLogin: false));
  }

  void updatePasswordFormMessage(String message) {
    emit(state.copyWith(passwordFormMessage: message));
  }
}
