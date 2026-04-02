import 'package:flutter/foundation.dart';

import '../../../app/core/constants/app_constants.dart';
import '../../../app/core/models/operation_result.dart';
import '../data/user_repository.dart';
import '../model/user_model.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required IUserRepository repository})
    : _repository = repository;

  final IUserRepository _repository;

  String _email = '';
  String _password = '';
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  void updateEmail(String value) {
    _email = value;
  }

  void updatePassword(String value) {
    _password = value;
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  String? validateEmail(String? email) {
    final String value = (email ?? '').trim();
    if (value.isEmpty) {
      return 'O email é obrigatório.';
    }
    if (!value.contains('@')) {
      return 'Informe um email válido.';
    }
    return null;
  }

  String? validatePassword(String? password) {
    final String value = (password ?? '').trim();
    if (value.isEmpty) {
      return 'A senha é obrigatória.';
    }
    if (value.length < AppConstants.minPasswordLength) {
      return 'Senha deve ter ao menos ${AppConstants.minPasswordLength} caracteres.';
    }
    return null;
  }

  Future<OperationResult<UserModel>> authenticate() async {
    final String normalizedEmail = _email.trim().toLowerCase();
    final String normalizedPassword = _password.trim();

    final String? emailError = validateEmail(normalizedEmail);
    if (emailError != null) {
      return OperationResult<UserModel>(success: false, message: emailError);
    }

    final String? passwordError = validatePassword(normalizedPassword);
    if (passwordError != null) {
      return OperationResult<UserModel>(success: false, message: passwordError);
    }

    final UserModel? user = _repository.authenticate(
      email: normalizedEmail,
      password: normalizedPassword,
    );

    if (user == null) {
      return const OperationResult<UserModel>(
        success: false,
        message: 'Email ou senha incorretos.',
      );
    }

    await _repository.saveSession(user);

    return OperationResult<UserModel>(
      success: true,
      message: 'Login realizado com sucesso.',
      data: user,
    );
  }
}
