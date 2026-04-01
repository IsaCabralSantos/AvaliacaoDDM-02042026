class UserModel {
  final String id;
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: (map['id'] ?? '').toString(),
      name: (map['name'] ?? '').toString(),
      email: (map['email'] ?? '').toString(),
      password: (map['password'] ?? '').toString(),
    );
  }

  @override
  String toString() => 'UserModel(name: $name, email: $email)';
}
