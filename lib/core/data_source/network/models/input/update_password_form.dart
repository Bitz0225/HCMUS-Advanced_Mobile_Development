class ChangePasswordForm {
  final String? oldPassword;
  final String? newPassword;

  ChangePasswordForm({this.oldPassword, this.newPassword});

  factory ChangePasswordForm.fromJson(Map<String, dynamic> json) {
    return ChangePasswordForm(
      oldPassword: json['oldPassword'] as String?,
      newPassword: json['newPassword'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'password': oldPassword,
      'newPassword': newPassword,
    };
  }

  ChangePasswordForm copyWith({
    String? oldPassword,
    String? newPassword,
  }) {
    return ChangePasswordForm(
      oldPassword: oldPassword ?? this.oldPassword,
      newPassword: newPassword ?? this.newPassword,
    );
  }
}