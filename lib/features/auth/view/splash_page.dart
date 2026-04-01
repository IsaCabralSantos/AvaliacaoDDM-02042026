import 'package:flutter/material.dart';

import '../../../app/core/constants/app_constants.dart';
import '../../../app/core/widgets/app_background.dart';
import '../../../app/core/widgets/glass_card.dart';
import '../viewmodel/splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, required this.viewModel});

  final SplashViewModel viewModel;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startSplashFlow();
  }

  Future<void> _startSplashFlow() async {
    final SplashRouteTarget target = await widget.viewModel
        .resolveInitialRoute();

    if (!mounted) {
      return;
    }

    Navigator.pushReplacementNamed(
      context,
      target.routeName,
      arguments: target.arguments,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: AppBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 470),
              child: Container(
                alignment: Alignment.center,
                child: GlassCard(
                  radius: AppConstants.defaultRadius,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet_rounded,
                            size: 44,
                            color: scheme.primary,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            AppConstants.appName,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: scheme.primary,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Carregando aplicativo...',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      CircularProgressIndicator(color: scheme.primary),
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
