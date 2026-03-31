class SignupViewModel {
  
  String? validarNome(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nome é obrigatório';
    }
    if (value.trim().length < 3) {
      return 'Nome deve ter pelo menos 3 caracteres';
    }
    return null;
  }

  String? validarEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email é obrigatório';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Digite um email válido';
    }
    return null;
  }

  String? validarSenha(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (value.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  String? validarConfirmarSenha({
    required String senha,
    required String? confirmarSenha,
  }) {
    if (confirmarSenha == null || confirmarSenha.isEmpty) {
      return 'Confirme sua senha';
    }
    if (senha != confirmarSenha) {
      return 'As senhas não coincidem';
    }
    return null;
  }

  bool fazerCadastro({
    required String nome,
    required String email,
    required String senha,
  }) {
    // Aqui você vai implementar a lógica real de cadastro (API, Firebase, etc.)
    // Por enquanto, vamos simular que sempre dá certo
    print('Cadastro realizado: $nome, $email');
    
    // Retorna true = sucesso | false = falhou
    return true;
  }
}
