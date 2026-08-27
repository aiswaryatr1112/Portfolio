import '../core/constants/asset_paths.dart';
import '../models/case_study.dart';

/// Selected case studies. Full editorial content lives here — UI renders it.
///
/// IMPORTANT: `outcome` is intentionally qualitative. No numerical metrics
/// (ROI %, sales figures, follower counts) have been invented. Replace with
/// real, approved numbers when available.
const List<CaseStudy> caseStudies = [
  CaseStudy(
    title: 'My First Campaign — Pepsi',
    slug: 'pepsi-first-campaign',
    client: 'Pepsi (project, business school)',
    category: 'Marketing',
    industry: 'FMCG / Beverages',
    year: 2009,
    summary:
        'A classroom project became a crash course in what a campaign really is — the strategy underneath and the launch above.',
    heroImage: AssetPaths.casePepsi,
    challenge:
        'At business school the brief was as simple as it was heavy: plan a campaign for a brand like Pepsi and defend it. With no budget, no agency and no experience, I had to build a strategy from nothing.',
    objective:
        'To build a coherent, believable campaign plan — positioning, audience, channels and creative direction — that would hold up in a room full of peers and faculty.',
    strategy:
        'Instead of chasing a single big idea, I anchored the campaign in understanding the young consumer the brand wanted, mapped the touchpoints, and built a launch that leaned on participation more than push.',
    execution:
        'I took the campaign from concept to a presented, defended package — research, a simple media plan and a launch concept — learning how far an idea advances when you commit to finishing it.',
    outcome:
        'The real takeaway was never the grade. I left certain that marketing begins with reading the audience, and that a finished, thought-through idea beats a flashy half-idea.',
    keyLearning:
        'Campaigns are stories you structure. Nail the audience and the why, and the creative has a place to land.',
    gallery: const [],
    related: const ['my-first-campaign-pepsi', 'things-i-learned-at-business-school'],
  ),
  CaseStudy(
    title: 'Stoub Biz Motors',
    slug: 'stoub-biz-marketing',
    client: 'Stoub Biz Motors',
    category: 'Automotive Marketing',
    industry: 'Automotive Retail & Distribution',
    year: 2020,
    summary:
        'Four years building automotive marketing — from product launches to the image people hold before they ever visit.',
    heroImage: AssetPaths.caseStoub,
    challenge:
        'To help an automotive business find its voice: campaigns and launches that had to feel premium, convincing and human at the same time.',
    objective:
        'Grow brand awareness and preference across launches and content, and shift perception from a place that sells machines to a place people want to be part of.',
    strategy:
        'Put storytelling and photography at the centre: real cars, real detail, real people. Content became the front door, launches the middle act, and service the ending worth coming back for.',
    execution:
        'Campaigns, launches and events across the portfolio, plus a disciplined content rhythm built around photography and video — the tools that matter most when you sell something sold.',
    outcome:
        'The brand moved from feature talk to a story people could follow. Qualitatively: stronger share of mind, better customer perception and a content presence that stood apart in the market.',
    keyLearning:
        'In automotive, the difference is often a feeling — and a steady flow of honest content builds more trust than any single ad.',
    gallery: const [],
    related: const ['4-years-a-marketer-at-stoub-biz-motors', 'why-dubai'],
  ),
CaseStudy(
    title: 'Automotive Brand Marketing',
    slug: 'automotive-brand-marketing',
    client: 'The Elite Cars',
    category: 'Automotive / Luxury',
    industry: 'Luxury Automotive',
    year: 2017,
    summary:
        'A short, sharp run in luxury automotive that taught me to sell a state of mind as much as a machine.',
    heroImage: AssetPaths.caseElite,
    challenge:
        'Luxury customers do not buy specifications; they buy confidence, exclusivity and attention. Losing any of those costs far more than an invoice.',
    objective:
        'Shape premium customer experience and positioning for marques including Jetour and supercars — to make the brand feel like the destination it actually is.',
    strategy:
        'Treat luxury as service and story. Every surface of the experience — car, space, language, follow-up — had to reinforce why this brand, this car and this moment deserved the premium.',
    execution:
        'Short but intense: customer journeys, premium communication and positioning work across supercars and marques.',
    outcome:
        'The lesson: in luxury, brand-building happens at every hand-off, and no campaign out-earns a bad experience.',
    keyLearning:
        'Luxury is a service attitude. Price confirms what experience already said.',
    gallery: const [],
    related: const ['a-short-stint-with-big-lessons-the-elite-cars'],
  ),
  CaseStudy(
    title: 'Bibigo Middle East',
    slug: 'bibigo-middle-east',
    client: 'Bibigo Middle East',
    category: 'Multi-Brand Marketing',
    industry: 'Food & Beverage / Portfolio',
    year: 2024,
    summary:
        'Part of a group-wide marketing story across food, motors and lifestyle — where one strong narrative helps every label stand.',
    heroImage: AssetPaths.caseBibigo,
    challenge:
        'A portfolio of brands across entirely different categories each needed its own voice while still carrying the group forward.',
    objective:
        'Build a group marketing culture and approach that respects category differences but shares one standard of storytelling.',
    strategy:
        'Common narrative tissue, local execution: each brand kept its own personality, the group kept the belief, and resources were shifted toward what each brand actually needed to tell.',
    execution:
        'Marketing Company FZE worked across Bibigo Middle East, Al Qubaisi, Novum, Al Khayyat and Ceramics — a group spanning food, motors and lifestyle.',
    outcome:
        'A multi-brand setup that strengthened consistency across Bibigo Middle East and its sister houses — qualitative gains in clarity and a story every label could tell without losing itself.',
    keyLearning:
        'Multi-brand marketing is pattern recognition and patience — the group story is the compounding asset.',
    gallery: const [],
    related: const ['bibigo-middle-east', 'why-dubai'],
  ),
];