import '../models/shared_stat.dart';

/// Key-fact figures shown in the statistics band.
///
/// IMPORTANT: These are the brief's indicative numbers and are clearly NOT
/// final. Replace `value`/`label` with correct figures before launch. The stats
/// widget reads the `AppConfig.keyFactsArePlaceholders` flag to show a small
/// "indicative figures" caption so nothing is presented as fabricated fact.
const List<SharedStat> keyStats = [
  SharedStat(value: 15, valueLabel: '+', label: 'Years / combined experience'),
  SharedStat(value: 8, valueLabel: '+', label: 'Brands & organizations'),
  SharedStat(value: 5, valueLabel: '+', label: 'Markets / countries'),
  SharedStat(value: 100, valueLabel: '+', label: 'Campaigns, projects & collaborations'),
];