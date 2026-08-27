/// One block inside a blog article's body. Keeps long-form content out of the
/// UI widgets and renderable from data.
enum ArticleBlockType { paragraph, subheading, pullQuote, quote, image, bullet }

class ArticleBlock {
  const ArticleBlock(this.type, this.text, {this.caption, this.imagePath});

  final ArticleBlockType type;

  /// Paragraph/subhead/pull-quote/quote text, or a bullet's line of text.
  final String text;

  /// Caption for image blocks.
  final String? caption;

  /// Asset path for image blocks.
  final String? imagePath;

  bool get isImage => type == ArticleBlockType.image;
}

class BlogPost {
  const BlogPost({
    required this.title,
    required this.slug,
    required this.category,
    required this.date,
    required this.excerpt,
    required this.readingMinutes,
    this.heroImage = '',
    this.content = const [],
    this.tags = const [],
    this.featured = false,
  });

  final String title;
  final String slug;
  final String category;
  final DateTime date;
  final String excerpt;
  final int readingMinutes;
  final String heroImage;
  final List<ArticleBlock> content;
  final List<String> tags;
  final bool featured;

  String get dateLabel {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}