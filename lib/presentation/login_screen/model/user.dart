class User {
  final String? name;
  final String? email;
  final String? password;

  User({this.name, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };

  @override
  String toString() {
    return 'User{name: $name, email: $email, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          password == other.password;

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ password.hashCode;

  //copyWith
  User copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return User(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
