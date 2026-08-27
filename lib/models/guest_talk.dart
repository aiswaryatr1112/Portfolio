class GuestTalk {
  const GuestTalk({
    required this.event,
    required this.topic,
    required this.location,
    required this.date,
    required this.description,
    this.link = '',
    this.imagePath = '',
  });

  final String event;
  final String topic;
  final String location;
  final String date;
  final String description;

  /// Optional video / article URL. Empty = not supplied yet (clearly marked).
  final String link;
  final String imagePath;
}

class Testimonial {
  const Testimonial({
    required this.quote,
    required this.person,
    required this.designation,
    required this.company,
    this.imagePath = '',
  });

  final String quote;
  final String person;
  final String designation;
  final String company;
  final String imagePath;

  bool get isPlaceholder => quote.isNotEmpty;
}