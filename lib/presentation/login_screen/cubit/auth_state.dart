import 'package:lettutor/core/data_source/network/models/input/auth_form.dart';
import 'package:lettutor/core/widget_cubit/widget_state.dart';

class AuthState extends WidgetState {
  final AuthForm? authForm;

  const AuthState({this.authForm});

  @override
  // TODO: implement props
  List<Object?> get props => [authForm];

  factory AuthState.fromJson(Map<String, dynamic> json) {
    return AuthState(
      authForm: json['authForm'] != null
          ? AuthForm.fromJson(json['authForm'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'authForm': authForm?.toJson(),
    };
  }

  AuthState copyWith({
    AuthForm? authForm,
  }) {
    return AuthState(
      authForm: authForm ?? this.authForm,
    );
  }

  @override
  int get hashCode => authForm.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthState &&
          runtimeType == other.runtimeType &&
          authForm == other.authForm;
}