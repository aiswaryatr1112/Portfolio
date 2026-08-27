/// One chapter in the career timeline (Story page).
class Experience {
  const Experience({
    required this.id,
    required this.organization,
    required this.role,
    required this.period,
    this.periodLabel,
    this.headline = '',
    this.summary = '',
    this.achievements = const [],
    this.lessons = const [],
    this.focus = const [],
    this.imagePath = '',
    this.major = false,
  });

  final String id;
  final String organization;
  final String role;

  /// Start year, used for ordering.
  final int period;

  /// Human label such as '2009 – 2010'.
  final String? periodLabel;

  /// Short display headline (e.g. 'First Job').
  final String headline;

  /// A sentence or two of narrative.
  final String summary;

  final List<String> achievements;
  final List<String> lessons;
  final List<String> focus;
  final String imagePath;
  final bool major;

  String get periodDisplay => periodLabel ?? '$period';
}