import 'package:flutter/material.dart';

import '../../../app/core/widgets/app_background.dart';
import '../../../app/core/widgets/glass_card.dart';
import '../../../app/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Home')),
      body: AppBackground(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: GlassCard(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      Icons.account_balance_wallet_rounded,
                      size: 90,
                      color: scheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Bem-vindo à Home',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Olá, $userName',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          AppRoutes.login,
                          (Route<dynamic> route) => false,
                        );
                      },
                      icon: const Icon(Icons.logout),
                      label: const Text('Sair'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
