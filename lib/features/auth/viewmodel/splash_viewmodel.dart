import '../../../app/core/constants/app_constants.dart';
import '../../../app/routes/app_routes.dart';

class SplashRouteTarget {
  const SplashRouteTarget({required this.routeName, this.arguments});

  final String routeName;
  final Object? arguments;
}

class SplashViewModel {
  const SplashViewModel();

  Future<void> waitSplash() async {
    await Future<void>.delayed(
      const Duration(seconds: AppConstants.splashDelaySeconds),
    );
  }

  Future<SplashRouteTarget> resolveInitialRoute() async {
    await waitSplash();
    return const SplashRouteTarget(routeName: AppRoutes.login);
  }
}
