import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_config.dart';
import '../core/design_tokens.dart';
import '../core/responsive/responsive.dart';
import '../core/utils/url_launcher_util.dart';
import 'section_shell.dart';
import 'whatsapp_dialog.dart';

/// Editorial footer: identity + tagline, links, connect row and back-to-top.
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.charcoal,
      padding:
          const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.xl, AppSpacing.lg, 24),
      child: ContentEnvelope(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppConfig.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: AppColors.textOnDark,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        AppConfig.tagline,
                        style: TextStyle(
                          color: AppColors.textOnDark.withValues(alpha: 0.65),
                          letterSpacing: 0.2,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Back to top',
                  onPressed: () {
                    final scroll = PageScroll.controllerOf(context);
                    scroll?.animateTo(0,
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeOut);
                  },
                  icon: const Icon(Icons.keyboard_arrow_up,
                      color: AppColors.textOnDark),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Divider(color: AppColors.border),
            const SizedBox(height: 20),
            if (context.isNarrow) _narrowLinks(context) else _wideLinks(context),
            const SizedBox(height: 20),
            const Divider(color: AppColors.borderDark),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(
                  '© 2026 ${AppConfig.name}',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.textOnDark.withValues(alpha: 0.5),
                  ),
                ),
                const Spacer(),
                Text(
                  'It starts with a story.',
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColors.textOnDark.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
Widget _wideLinks(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _linkGroup(context, 'Explore', exploreLinks)),
        Expanded(
            flex: 2,
            child: _linkGroup(context, 'Connect', const [
              ('LinkedIn', 'linkedin'),
              ('Contact', 'contact'),
            ])),
        const SizedBox(width: 40),
        _connectIcons(context),
      ],
    );
  }

  Widget _narrowLinks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _linkGroup(context, 'Explore', exploreLinks),
        const SizedBox(height: 16),
        _linkGroup(context, 'Connect', const [
          ('LinkedIn', 'linkedin'),
          ('Contact', 'contact'),
        ]),
        const SizedBox(height: 20),
        _connectIcons(context),
      ],
    );
  }

  static const exploreLinks = [
    ('Story', '/story'),
    ('Case Studies', '/case-studies'),
    ('Blog', '/blog'),
    ('Guest Talks', '/guest-talks'),
  ];

  Widget _linkGroup(BuildContext context, String title,
      List<(String, String)> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            color: AppColors.textOnDark.withValues(alpha: 0.45),
            fontSize: 11.5,
            letterSpacing: 1.6,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        ...links.map((l) => _footerLink(context, l.$1, l.$2)),
      ],
    );
  }

  Widget _footerLink(BuildContext context, String label, String key) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        onTap: () {
          switch (key) {
            case 'contact':
              showWhatsAppDialog(context);
              break;
            case 'linkedin':
              UrlLauncherUtil.launchWeb(context, AppConfig.linkedinUrl);
              break;
            default:
              context.go(key);
          }
        },
        child: Text(
          label,
          style: TextStyle(
            color: AppColors.textOnDark.withValues(alpha: 0.82),
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _connectIcons(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        _socialIcon(context, Icons.chat_bubble_outline, 'WhatsApp',
            () => showWhatsAppDialog(context)),
        _socialIcon(context, Icons.alternate_email, 'LinkedIn',
            () => UrlLauncherUtil.launchWeb(context, AppConfig.linkedinUrl)),
        _socialIcon(context, Icons.mail_outline, 'Email',
            () => UrlLauncherUtil.launchWeb(
                context, 'mailto:${AppConfig.emailAddress}')),
      ],
    );
  }

  Widget _socialIcon(BuildContext context, IconData icon, String label,
      VoidCallback onTap) {
    return Tooltip(
      message: label,
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon,
            color: AppColors.textOnDark.withValues(alpha: 0.9), size: 20),
      ),
    );
  }
}