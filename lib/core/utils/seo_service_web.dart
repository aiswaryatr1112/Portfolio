import 'package:web/web.dart' as web;

/// Web implementation: writes the document title and description meta tag so
/// each routed page gets meaningful, shareable metadata.
///
/// Kept intentionally lean — Flutter is a canvas application, so this covers
/// the basics (title + description) rather than over-promising SEO.
void setPageMeta({required String title, String? description}) {
  web.document.title = title;
  if (description != null && description.isNotEmpty) {
    web.document
        .querySelector('meta[name="description"]')
        ?.setAttribute('content', description);
  }
}