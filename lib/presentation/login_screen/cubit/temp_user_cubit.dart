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
    final initListUser = <User>[
      User(
          email: 'teacher@lettutor.com',
          password: '123456',
          name: 'Teacher',
          isTeacher: true),
      User(email: 'student@lettutor.com', password: '123456', name: 'Student')
    ];
    emit(state.copyWith(listUser: initListUser));
  }

  Future<void> register(User user) async {
    final listUser = (state.listUser ?? [])
    ..add(user);
    emit(state.copyWith(listUser: listUser));
  }

  Future<void> login(String? username, String? password) async {
    final listUser = state.listUser ?? [];
    final user = listUser.where((element) => element.email == username && element.password == password);
    if (user.isNotEmpty) {
      emit(state.copyWith(currentUser: user.first));
    }
  }

  Future<(bool, String)> updatePasswordByEmail(String? email, String? password, String? confirmedPassword) async {
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
