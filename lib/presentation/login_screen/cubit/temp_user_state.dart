import 'package:lettutor/core/widget_cubit/widget_state.dart';
import 'package:lettutor/presentation/login_screen/model/user.dart';

class TempUserState extends WidgetState {
  const TempUserState({this.listUser});

  final List<User>? listUser;

  @override
  // TODO: implement props
  List<Object?> get props => [];

  factory TempUserState.fromJson(Map<String, dynamic> json) {
    return const TempUserState();
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TempUserState &&
          runtimeType == other.runtimeType &&
          listUser == other.listUser;

  @override
  int get hashCode => listUser.hashCode;

  TempUserState copyWith({
    List<User>? listUser,
  }) {
    return TempUserState(
      listUser: listUser ?? this.listUser,
    );
  }
}