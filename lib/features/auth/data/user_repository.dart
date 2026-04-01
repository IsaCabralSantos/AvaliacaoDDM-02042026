import '../model/user_model.dart';
import 'user_mock_store.dart';

abstract class IUserRepository {
  Future<void> init();

  UserModel? authenticate({required String email, required String password});

  bool register(UserModel user);

  bool emailExists(String email);

  UserModel? loggedUser();

  Future<void> saveSession(UserModel user);
}

class UserMockRepository implements IUserRepository {
  UserMockRepository({UserMockStore? store})
    : _store = store ?? UserMockStore.instance;

  final UserMockStore _store;

  bool _initialized = false;

  @override
  Future<void> init() async {
    if (_initialized) {
      return;
    }

    _initialized = true;
  }

  @override
  UserModel? authenticate({required String email, required String password}) {
    return _store.findByCredentials(email: email, password: password);
  }

  @override
  bool register(UserModel user) {
    return _store.register(user);
  }

  @override
  bool emailExists(String email) {
    return _store.emailExists(email);
  }

  @override
  UserModel? loggedUser() {
    return _store.getLoggedUser();
  }

  @override
  Future<void> saveSession(UserModel user) async {
    _store.saveSession(user.email);
  }
}
