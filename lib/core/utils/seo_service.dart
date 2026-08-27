/// Cross-platform SEO helper.
///
/// The web implementation (seo_service_web.dart) writes document <title> and
/// meta description via `package:web`; the stub (seo_service_stub.dart) is a
/// no-op for non-web targets so this file compiles everywhere.
library;

export 'seo_service_stub.dart'
    if (dart.library.js_interop) 'seo_service_web.dart';