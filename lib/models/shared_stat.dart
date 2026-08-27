/// A single "key fact" statistic shown with a counted-up number.
class SharedStat {
  const SharedStat({
    required this.value,
    required this.label,
    this.valueLabel = '',
  });

  /// Numeric part of the value, e.g. 15.
  final num value;
  final String label;

  /// Suffix such as '+' or '%' appended to the counted number.
  final String valueLabel;
}