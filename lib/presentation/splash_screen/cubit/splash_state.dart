import 'package:lettutor/core/data_source/network/models/output/user_model.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class SplashState extends WidgetState {
  final User? user;
  final bool? isLogin;
  final String? message;
  final String? passwordFormMessage;
  final String? updateProfileFormMessage;
  const SplashState({this.isLogin, this.message, this.user, this.passwordFormMessage, this.updateProfileFormMessage});

  @override
  // TODO: implement props
  List<Object?> get props => [
    user,
    isLogin,
    message,
    passwordFormMessage,
    updateProfileFormMessage,
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
      message: json['message'] as String?,
      passwordFormMessage: json['passwordFormMessage'] as String?,
      updateProfileFormMessage: json['updateProfileFormMessage'] as String?,
    );
  }

  SplashState copyWith({
    User? user,
    bool? isLogin,
    String? message,
    String? passwordFormMessage,
    String? updateProfileFormMessage,
  }) {
    return SplashState(
      user: user ?? this.user,
      isLogin: isLogin ?? this.isLogin,
      message: message ?? this.message,
      passwordFormMessage: passwordFormMessage ?? this.passwordFormMessage,
      updateProfileFormMessage: updateProfileFormMessage ?? this.updateProfileFormMessage,
    );
  }
}