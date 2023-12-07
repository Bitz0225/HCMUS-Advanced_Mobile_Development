import 'package:lettutor/common/storage/local_storage.dart';
import 'package:lettutor/core/app_config/dependency.dart';
import 'package:lettutor/core/repository/auth_repository/auth_repository.dart';
import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/lettutor_app/lettutor_app.dart';
import 'package:lettutor/presentation/splash_screen/cubit/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends WidgetCubit<SplashState> {
  SplashCubit() : super(initialState: const SplashState(), parseJsonFunction: SplashState.fromJson);

  @override
  Future<void> init() async {
    final _authRepository = getIt.get<AuthRepository>();
  }

  Future<void>  _handleScreenNavigate() async {
    final localStorage = getIt.get<SharedPreferences>();
    final accessToken = localStorage.getString(StorageKey.accessToken.toString());

    if (accessToken == null) {

    }
    return;
  }

}