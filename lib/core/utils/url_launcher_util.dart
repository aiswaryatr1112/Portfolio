import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/app_config.dart';

/// Guarded launcher for external URLs.
///
///  - Launches http(s), mailto, tel, wa.me links via url_launcher.
///  - When a URL is still an unconfigured placeholder (or empty), shows a
///    friendly "not configured yet" snackbar instead of launching an invented
///    or broken link.
class UrlLauncherUtil {
  UrlLauncherUtil._();

  /// A URL is treated as "real" when it is non-empty and does not contain the
  /// placeholder marker that still signals "not supplied yet".
  static bool _isConfigured(String url) =>
      url.isNotEmpty &&
      !url.contains('PLACEHOLDER') &&
      !url.startsWith('000000');

  /// Opens any external URL gracefully.
  static Future<void> launchWeb(BuildContext context, String url) async {
    if (!_isConfigured(url)) {
      _showNotConfigured(context, 'This link is not configured yet.');
      return;
    }
    try {
      final ok = await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
      if (!ok && context.mounted) _showNotConfigured(context, 'Could not open this link.');
    } catch (_) {
      if (context.mounted) _showNotConfigured(context, 'Could not open this link.');
    }
  }

  /// Opens the central WhatsApp number with the pre-filled portfolio message.
  static void openWhatsApp(BuildContext context) {
    final number = AppConfig.whatsappNumber;
    final message = Uri.encodeComponent(AppConfig.whatsappMessage);
    launchWeb(context, 'https://wa.me/$number?text=$message');
  }

  static void _showNotConfigured(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}