import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/data_source/network/data_state.dart';
import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
import 'package:lettutor/core/network/network_manager.dart';
import 'package:lettutor/core/repository/auth_repository/auth_repository.dart';
import 'package:lettutor/core/repository/user_repository/user_repository.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/login_screen/cubit/auth_state.dart';

class AuthCubit extends WidgetCubit<AuthState> {
  AuthCubit()
      : super(
          initialState: const AuthState(),
          parseJsonFunction: AuthState.fromJson,
        );

  final _authRepository = getIt.get<AuthRepository>();
  final _userRepository = getIt.get<UserRepository>();
  final _localStorage = getIt.get<LocalStorage>();

  @override
  Future<void> init() async {

  }

  Future<void> login({String? email, String? password}) async {
    showLoading();
    final _form = AuthForm().copyWith(email: email, password: password);
    final result = await _authRepository.login(_form);
    if (result is DataSuccess) {
      final user = result.data?.user;
      final accessToken = result.data?.tokens?.access?.token;
      final refreshToken = result.data?.tokens?.refresh?.token;
      _localStorage
        ..saveString(key: StorageKey.accessToken, value: accessToken ?? '')
        ..saveString(key: StorageKey.refreshToken, value: refreshToken ?? '');
      getIt.get<NetworkManager>().updateHeader(accessToken: accessToken);
      emit(state.copyWith(user: user, isLogin: true));
    } else {
      emit(state.copyWith(isLogin: false, message: result.error?.response?.data['message'] as String? ?? ''));
    }
    hideLoading();
  }

  Future<void> register({String? email, String? password}) async {
    final _form = AuthForm().copyWith(email: email, password: password);
    final result = await _authRepository.register(_form);
    if (result is DataSuccess) {
      emit(state.copyWith(isRegister: true, message: 'Register success! Please check your email to verify your account.'));
    } else {
      emit(state.copyWith(isRegister: false, message: result.error?.response?.data['message'] as String? ?? ''));
    }
  }
}
