import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design_tokens.dart';
import '../../widgets/app_button.dart';

/// Renders wherever a route is missing — the explicit /404 route and the
/// error builder. Standalone: it carries its own Scaffold (no Navbar/Footer).
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '404',
                style: theme.textTheme.displayLarge?.copyWith(
                  color: AppColors.accent,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'This page is somewhere out on the road.',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),
              AppButton.primary(
                'Back home',
                icon: Icons.arrow_back,
                iconEnd: false,
                onTap: () => context.go('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}