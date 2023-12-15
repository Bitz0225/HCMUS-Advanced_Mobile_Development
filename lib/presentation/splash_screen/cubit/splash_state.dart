import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class SplashState extends WidgetState {
  final User? user;
  final bool? isLogin;
  const SplashState({this.isLogin, this.user, });

  @override
  // TODO: implement props
  List<Object?> get props => [
    user,
    isLogin,
  ];

  @override
  Map<String, dynamic> toJson() {
    return {};
  }

  factory SplashState.fromJson(Map<String, dynamic> json) {
    return SplashState(
      user: json['user'] != null
          ? User.fromJson(json['user'] as Map<String, dynamic>)
          : null,
      isLogin: json['isLogin'] as bool?,
    );
  }

  SplashState copyWith({
    User? user,
    bool? isLogin,
  }) {
    return SplashState(
      user: user ?? this.user,
      isLogin: isLogin ?? this.isLogin,
    );
  }
}