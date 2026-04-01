import 'package:flutter/material.dart';

import '../../features/auth/data/user_repository.dart';
import '../../features/auth/view/login_page.dart';
import '../../features/auth/view/register_page.dart';
import '../../features/auth/view/splash_page.dart';
import '../../features/auth/viewmodel/login_viewmodel.dart';
import '../../features/auth/viewmodel/register_viewmodel.dart';
import '../../features/auth/viewmodel/splash_viewmodel.dart';
import '../../features/home/view/home_page.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static Route<dynamic> onGenerateRoute(
    RouteSettings settings,
    IUserRepository userRepository,
  ) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute<void>(
          builder: (_) => const SplashPage(viewModel: SplashViewModel()),
          settings: settings,
        );
      case AppRoutes.login:
        return MaterialPageRoute<void>(
          builder: (_) => _LoginRoutePage(userRepository: userRepository),
          settings: settings,
        );
      case AppRoutes.register:
        return MaterialPageRoute<void>(
          builder: (_) => _RegisterRoutePage(userRepository: userRepository),
          settings: settings,
        );
      case AppRoutes.home:
        final String userName = settings.arguments is String
            ? settings.arguments! as String
            : 'Usuário';
        return MaterialPageRoute<void>(
          builder: (_) => HomePage(userName: userName),
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => const SplashPage(viewModel: SplashViewModel()),
          settings: settings,
        );
    }
  }
}

class _LoginRoutePage extends StatefulWidget {
  const _LoginRoutePage({required this.userRepository});

  final IUserRepository userRepository;

  @override
  State<_LoginRoutePage> createState() => _LoginRoutePageState();
}

class _LoginRoutePageState extends State<_LoginRoutePage> {
  late final LoginViewModel _viewModel = LoginViewModel(
    repository: widget.userRepository,
  );

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginPage(viewModel: _viewModel);
  }
}

class _RegisterRoutePage extends StatefulWidget {
  const _RegisterRoutePage({required this.userRepository});

  final IUserRepository userRepository;

  @override
  State<_RegisterRoutePage> createState() => _RegisterRoutePageState();
}

class _RegisterRoutePageState extends State<_RegisterRoutePage> {
  late final RegisterViewModel _viewModel = RegisterViewModel(
    repository: widget.userRepository,
  );

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RegisterPage(viewModel: _viewModel);
  }
}
