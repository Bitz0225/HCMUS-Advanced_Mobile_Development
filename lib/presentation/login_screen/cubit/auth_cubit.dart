import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/login_screen/cubit/auth_state.dart';

class AuthCubit extends WidgetCubit<AuthState> {
  AuthCubit() : super(initialState: const AuthState(),
    parseJsonFunction: AuthState.fromJson
  );

  void login(String email, String password) {
    emit(state.copyWith(
      authForm: AuthForm(
        email: email,
        password: password,
      ),
    ));
  }

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }
}