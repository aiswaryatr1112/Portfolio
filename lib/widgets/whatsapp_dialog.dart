import 'package:flutter/material.dart';
import '../core/constants/app_config.dart';
import '../core/design_tokens.dart';
import '../core/responsive/responsive.dart';
import '../core/utils/url_launcher_util.dart';
import 'app_button.dart';

/// Polished modal offering the primary conversion: chat on WhatsApp. Uses the
/// central number/message from [AppConfig]. "Maybe Later" simply dismisses.
Future<void> showWhatsAppDialog(BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierColor: AppColors.ink.withValues(alpha: 0.55),
    builder: (context) => const _WhatsAppDialog(),
  );
}

class _WhatsAppDialog extends StatelessWidget {
  const _WhatsAppDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.isMobile ? 20 : 32,
        vertical: 24,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(36, 34, 36, 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Icon(Icons.chat_bubble_outline,
                        color: AppColors.accent, size: 22),
                  ),
                  IconButton(
                    tooltip: 'Close',
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: AppColors.textMuted),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Text(
                'Let\u2019s Do It Now.',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.textPrimary),
              ),
              const SizedBox(height: 10),
              Text(
                'Tell me what you\u2019re working on and let\u2019s see where the conversation goes.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.textSecondary),
              ),
              const SizedBox(height: 26),
              SizedBox(
                width: double.infinity,
                child: AppButton.primary(
                  'Chat on WhatsApp',
                  icon: Icons.chat_bubble_outline,
                  onTap: () => UrlLauncherUtil.openWhatsApp(context),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Maybe Later',
                      style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}