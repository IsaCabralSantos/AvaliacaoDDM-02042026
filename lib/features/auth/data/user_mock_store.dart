import '../model/user_model.dart';

class UserMockStore {
  UserMockStore._();

  static final UserMockStore instance = UserMockStore._();

  static final List<UserModel> _users = <UserModel>[
    UserModel(
      id: '1',
      name: 'Marcelo Ciacco',
      email: 'marcelo.almeida@unifeob.pro.br',
      password: 'unifeob@123',
    ),
    UserModel(
      id: '2',
      name: 'João Augusto',
      email: 'teste@teste',
      password: 'teste@teste',
    ),
  ];

  static String? _loggedUserEmail;

  List<UserModel> get users => List<UserModel>.unmodifiable(_users);

  void replaceUsers(List<UserModel> users) {
    _users
      ..clear()
      ..addAll(users);
  }

  UserModel? findByCredentials({
    required String email,
    required String password,
  }) {
    final String normalizedEmail = email.trim().toLowerCase();
    final String normalizedPassword = password.trim();

    for (final UserModel user in _users) {
      final bool isSameEmail =
          user.email.trim().toLowerCase() == normalizedEmail;
      final bool isSamePassword = user.password == normalizedPassword;

      if (isSameEmail && isSamePassword) {
        return user;
      }
    }

    return null;
  }

  bool emailExists(String email) {
    final String normalizedEmail = email.trim().toLowerCase();
    return _users.any(
      (UserModel user) => user.email.trim().toLowerCase() == normalizedEmail,
    );
  }

  UserModel? findByEmail(String email) {
    final String normalizedEmail = email.trim().toLowerCase();

    for (final UserModel user in _users) {
      if (user.email.trim().toLowerCase() == normalizedEmail) {
        return user;
      }
    }

    return null;
  }

  bool register(UserModel user) {
    if (emailExists(user.email)) {
      return false;
    }

    final UserModel normalizedUser = user.copyWith(
      id: (_users.length + 1).toString(),
      name: user.name.trim(),
      email: user.email.trim().toLowerCase(),
      password: user.password.trim(),
    );

    _users.add(normalizedUser);
    return true;
  }

  UserModel? getLoggedUser() {
    final String? email = _loggedUserEmail;
    if (email == null || email.trim().isEmpty) {
      return null;
    }

    return findByEmail(email);
  }

  void saveSession(String email) {
    _loggedUserEmail = email.trim().toLowerCase();
  }
}
