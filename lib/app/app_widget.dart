import 'package:flutter/material.dart';

import '../features/auth/data/user_repository.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final IUserRepository _userRepository = UserMockRepository();

  @override
  void initState() {
    super.initState();
    _userRepository.init();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: (RouteSettings settings) {
        return AppPages.onGenerateRoute(settings, _userRepository);
      },
    );
  }
}
