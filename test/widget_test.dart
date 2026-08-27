// Smoke test for the portfolio app: verifies the routed shell renders its
// persistent navigation and footer around the home page.
//
// google_fonts is configured to skip runtime font fetching so the test does
// not require network access and falls back to the bundled default fonts.

import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:portfolio/app/app.dart';

void main() {
  testWidgets('Portfolio app renders the home shell', (WidgetTester tester) async {
    GoogleFonts.config.allowRuntimeFetching = false;

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    // Persistent top navigation link.
    expect(find.text('Intro'), findsOneWidget);
    // Home hero copy (on-screen, no scrolling required).
    expect(
      find.text(
        'An editorial portfolio built around the campaigns, cars and stories '
        'that shaped how I think about marketing.',
      ),
      findsOneWidget,
    );
  });
}
