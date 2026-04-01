import 'package:flutter/material.dart';

import '../../../app/core/widgets/app_background.dart';
import '../../../app/core/widgets/glass_card.dart';
import '../viewmodel/register_viewmodel.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.viewModel});

  final RegisterViewModel viewModel;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RegisterViewModel get _viewModel => widget.viewModel;

  Future<void> _submit() async {
    final FormState? form = _formKey.currentState;
    if (form == null || !form.validate()) {
      return;
    }

    final result = await _viewModel.register();

    if (!mounted) {
      return;
    }

    if (!result.success) {
      _showMessage(result.message, isError: true);
      return;
    }

    Navigator.pop(context, result.message);
  }

  void _showMessage(String message, {bool isError = false}) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color backgroundColor = isError
        ? scheme.errorContainer
        : scheme.primary;
    final Brightness brightness = ThemeData.estimateBrightnessForColor(
      backgroundColor,
    );
    final Color foregroundColor = brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: TextStyle(color: foregroundColor)),
          backgroundColor: backgroundColor,
        ),
      );
  }

  String? _validateConfirmation(String? value) {
    final String? baseValidation = _viewModel.validateConfirmPassword(value);
    if (baseValidation != null) {
      return baseValidation;
    }

    final String password = _viewModel.currentPassword;
    if ((value ?? '').trim() != password) {
      return 'As senhas precisam ser iguais.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Cadastro')),
      body: AppBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: GlassCard(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Crie sua conta',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Nome'),
                        onChanged: _viewModel.updateName,
                        validator: _viewModel.validateName,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(labelText: 'E-mail'),
                        onChanged: _viewModel.updateEmail,
                        validator: _viewModel.validateEmail,
                      ),
                      const SizedBox(height: 12),
                      AnimatedBuilder(
                        animation: _viewModel,
                        builder: (BuildContext context, Widget? child) {
                          return TextFormField(
                            obscureText: _viewModel.obscurePassword,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              suffixIcon: IconButton(
                                onPressed: _viewModel.togglePasswordVisibility,
                                icon: Icon(
                                  _viewModel.obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            onChanged: _viewModel.updatePassword,
                            validator: _viewModel.validatePassword,
                          );
                        },
                      ),
                      const SizedBox(height: 12),
                      AnimatedBuilder(
                        animation: _viewModel,
                        builder: (BuildContext context, Widget? child) {
                          return TextFormField(
                            obscureText: _viewModel.obscureConfirmPassword,
                            decoration: InputDecoration(
                              labelText: 'Confirmar senha',
                              suffixIcon: IconButton(
                                onPressed:
                                    _viewModel.toggleConfirmPasswordVisibility,
                                icon: Icon(
                                  _viewModel.obscureConfirmPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            onChanged: _viewModel.updateConfirmPassword,
                            validator: _validateConfirmation,
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: _submit,
                        child: const Text('Salvar cadastro'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Já tem uma conta? Ir para login!'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}