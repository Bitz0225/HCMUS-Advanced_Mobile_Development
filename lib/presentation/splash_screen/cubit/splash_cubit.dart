import 'package:lettutor/common/config/navigation_event.dart';
import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/failure_model.dart';
import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/network/network_manager.dart';
import 'package:lettutor/core/repository/auth_repository/auth_repository.dart';
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
  final _localStorage = getIt.get<LocalStorage>();
  final _authRepository = getIt.get<AuthRepository>();

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
        emit(state.copyWith(user: user.data));
      } else {
        emit(state.copyWith(isLogin: false));
      }
    }

  }

  Future<void> logout() async {
    await _localStorage.clear();
    emit(state.copyWith(isLogin: false));
  }
}
