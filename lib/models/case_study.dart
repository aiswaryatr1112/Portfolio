class CaseStudy {
  const CaseStudy({
    required this.title,
    required this.slug,
    required this.client,
    required this.category,
    required this.year,
    required this.summary,
    this.heroImage = '',
    this.challenge = '',
    this.objective = '',
    this.strategy = '',
    this.execution = '',
    this.outcome = '',
    this.keyLearning = '',
    this.industry = '',
    this.gallery = const [],
    this.related = const [],
  });

  final String title;
  final String slug;
  final String client;
  final String category;
  final int year;
  final String summary;
  final String heroImage;

  // Full editorial content fields.
  final String industry;
  final String challenge;
  final String objective;
  final String strategy;
  final String execution;

  /// Qualitative only — no fabricated metrics.
  final String outcome;
  final String keyLearning;

  final List<String> gallery;
  final List<String> related;

  bool get hasFullContent => challenge.isNotEmpty || strategy.isNotEmpty;
}