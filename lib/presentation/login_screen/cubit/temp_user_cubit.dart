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
}
