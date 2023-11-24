import 'package:lettutor/core/widget_cubit/widget_state.dart';
import 'package:lettutor/presentation/login_screen/model/user.dart';

class TempUserState extends WidgetState {
  const TempUserState({this.listUser, this.currentUser});

  final List<User>? listUser;
  final User? currentUser;

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
          listUser == other.listUser &&
          currentUser == other.currentUser;

  @override
  int get hashCode => listUser.hashCode ^ currentUser.hashCode;

  TempUserState copyWith({
    List<User>? listUser,
    User? currentUser,
  }) {
    return TempUserState(
      listUser: listUser ?? this.listUser,
      currentUser: currentUser ?? this.currentUser,
    );
  }
}