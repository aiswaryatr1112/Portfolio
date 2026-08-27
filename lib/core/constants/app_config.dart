/// Central application configuration.
///
/// Every external value that will need to be changed later lives here — one
/// place to edit, references everywhere else.
///
/// IMPORTANT: All external URLs below are clearly-marked placeholders. Nothing
/// has been invented. Replace them with the real values before launch. Widgets
/// surface a friendly "not configured yet" state when a URL is still marked
/// as a placeholder (see UrlLauncherUtil).
class AppConfig {
  AppConfig._();

  // ---------------------------------------------------------------------------
  // Brand
  // ---------------------------------------------------------------------------
  static const String name = 'Nikhil Thekkumkoottathil';
  static const String shortName = 'Nikhil';
  static const String tagline = 'Marketing • Automotive • Storytelling';
  static const String roleLine =
      'Marketing  •  Automotive  •  Storytelling';

  // ---------------------------------------------------------------------------
  // Contact — PLACEHOLDERS. Replace these values.
  // ---------------------------------------------------------------------------
  /// International format, digits only (e.g. '971501234567').
  static const String whatsappNumber = '000000000000'; // PLACEHOLDER
  static const String linkedinUrl =
      'https://www.linkedin.com/in/YOUR-PLACEHOLDER'; // PLACEHOLDER
  static const String emailAddress = 'hello@placeholder.email'; // PLACEHOLDER
  static const String instagramUrl = ''; // PLACEHOLDER (empty = hidden)

  /// WhatsApp pre-filled message (used by the modal & quick actions).
  static const String whatsappMessage =
      'Hi Nikhil, I came across your portfolio and would like to discuss a collaboration.';

  // ---------------------------------------------------------------------------
  // Content status flags.
  //
  // These mark whether the placeholder assets/figures/content shown are still
  // awaiting real materials. When everything has been replaced, flip them to
  // `false` to hide the "placeholder" captions across the site.
  // ---------------------------------------------------------------------------
  static const bool keyFactsArePlaceholders = true;
  static const bool imagesArePlaceholders = true;
  static const bool testimonialsArePlaceholders = true;
  static const bool guestTalksArePlaceholders = true;
}