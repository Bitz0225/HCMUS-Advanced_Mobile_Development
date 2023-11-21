class User {
  final String? name;
  final String? email;
  final String? password;
  final bool? isTeacher;

  User({this.isTeacher = false, this.name, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      isTeacher: json['isTeacher'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'isTeacher': isTeacher,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          password == other.password &&
          isTeacher == other.isTeacher;

  @override
  int get hashCode =>
      name.hashCode ^ email.hashCode ^ password.hashCode ^ isTeacher.hashCode;

  User copyWith({
    String? name,
    String? email,
    String? password,
    bool? isTeacher,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      isTeacher: isTeacher ?? this.isTeacher,
    );
  }
}
