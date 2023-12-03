import 'package:lettutor/core/widget_cubit/widget_cubit.dart';
import 'package:lettutor/presentation/login_screen/cubit/temp_user_state.dart';
import 'package:lettutor/presentation/login_screen/model/user.dart';

class TempUserCubit extends WidgetCubit<TempUserState> {
  TempUserCubit()
      : super(
            initialState: const TempUserState(),
            parseJsonFunction: TempUserState.fromJson);

  @override
  Future<void> init() async {

  }

  Future<void> register({String? email, String? password}) async {
    final listUser = (state.listUser ?? [])
      ..add(User(email: email, password: password));
    emit(state.copyWith(listUser: listUser));
  }

  Future<void> login({String? email, String? password}) async {
    final listUser = state.listUser ?? [];
    final user = listUser.firstWhere(
        (element) => element.email == email && element.password == password);
    emit(state.copyWith(currentUser: user));
  }

  Future<(bool, String)> updatePasswordByEmail(
      {String? email, String? password, String? confirmedPassword}) async {
    final listUser = state.listUser ?? [];
    if (password != confirmedPassword) {
      return (false, 'Password and confirmed password are not match');
    }
    final user = listUser.where((element) => element.email == email);
    if (user.isNotEmpty) {
      final newListUser = listUser.map((e) {
        if (e.email == email) {
          return e.copyWith(password: password);
        }
        return e;
      }).toList();
      emit(state.copyWith(listUser: [...newListUser]));
      return (true, 'Update password successfully');
    }
    return (false, 'Email is not exist');
  }
}
