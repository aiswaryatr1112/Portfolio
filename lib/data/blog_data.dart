import '../core/constants/asset_paths.dart';
import '../models/blog_post.dart';

/// All blog posts. Content lives here, rendered generically by the UI.
///
/// Slug conventions are stable and used for deep links (/blog/:slug) and for
/// related-story references from case studies.
final List<BlogPost> blogPosts = [
  // ---------------------------------------------------------------------------
  // 1. My First Campaign — Pepsi!
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'My First Campaign — Pepsi!',
    slug: 'my-first-campaign-pepsi',
    category: 'Marketing',
    date: DateTime(2009, 6, 1),
    excerpt:
        'Before I had a title or a budget, I had a Pepsi brief and a classroom. That project taught me what a campaign actually is.',
    readingMinutes: 4,
    heroImage: AssetPaths.blogPepsi,
    featured: true,
    tags: ['marketing', 'campaign', 'pepsi', 'firsts'],
    content: [
      ArticleBlock(ArticleBlockType.paragraph,
          'My first campaign had no budget, no agency and no experience behind it. It had a brief: plan a campaign for Pepsi and defend it to a room of people ready to pick it apart.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Looking back, the strategy I built would make a senior marketer wince. That is exactly the point — the project forced you to think like a marketer before you knew what the word meant. Where is the audience? What are they already saying? Why would they care?'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Campaigns are stories you structure. Nail the audience and the why, and the creative has a place to land.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The takeaway was not really about Pepsi. It was that a finished, thought-through idea beats a flashy half-idea every time — because you can defend the first one.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 2. Things I Learned at Business School
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Things I Learned at Business School',
    slug: 'things-i-learned-at-business-school',
    category: 'Career',
    date: DateTime(2024, 6, 10),
    excerpt:
        'The syllabus matters less than what the whole experience taught you about people, pressure and deadlines.',
    readingMinutes: 5,
    tags: ['career', 'business-school', 'learning', 'leadership'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Most of what I remember from business school never appeared in a textbook. It was the deadlines, the late-night case discussions and the geometry of group projects.'),
      ArticleBlock(ArticleBlockType.subheading, 'Group projects are a mirror'),
      ArticleBlock(ArticleBlockType.paragraph,
          'You learn fast who delivers and who talks about delivering. More usefully, you learn how to get the best out of both — which is a large part of what management and marketing actually are.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'The best projects come from passionate small teams, not big budgets.'),
    ],
  ),
  // ---------------------------------------------------------------------------
  // 3. Case Studies & Research Papers
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Case Studies & Research Papers',
    slug: 'case-studies-and-research-papers',
    category: 'Career',
    date: DateTime(2024, 6, 18),
    excerpt:
        'Writing research by hand forced the discipline that later made my marketing stand on evidence, not vibes.',
    readingMinutes: 4,
    tags: ['research', 'career', 'writing', 'business-school'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'At business school, research papers were the closest thing I had to a laboratory. They taught me that a good conclusion needs a trail — from question, to method, to evidence, to answer.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Every case we studied was someone else’s story in miniature. Choose the right question and the paper practically wrote itself; choose badly and no amount of effort could save it.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Research teaches you to separate what you believe from what you can show.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'That instinct — test the story against the evidence — became the quiet standard I hold every campaign to.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 4. College President
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'College President',
    slug: 'college-president',
    category: 'Personal',
    date: DateTime(2024, 7, 2),
    excerpt:
      'Being president taught me to lead without authority, host without a script, and finish things that are purely voluntary.',
    readingMinutes: 4,
    tags: ['leadership', 'personal', 'college'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Being student president is leadership with the hardest constraint of all: nobody actually has to listen to you.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'You learn to persuade rather than command, to represent a group and argue for it, and to carry events that only work if everyone chooses to pitch in.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'People follow a reason and a mood before they follow a title.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Everything about marketing — audience, tone, timing, reading a room — I rehearsed years before I ever held a marketing title.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 5. 6 Months of Britannia Sales
  // ---------------------------------------------------------------------------
  BlogPost(
    title: '6 Months of Britannia Sales',
    slug: 'six-months-of-britannia-sales',
    category: 'Sales',
    date: DateTime(2024, 7, 15),
    excerpt:
      'Counting biscuits onto a shelf taught me that salesmanship is mostly an act of care: for the customer, the count and the commitment.',
    readingMinutes: 4,
    tags: ['sales', 'britannia', 'firsts', 'discipline'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Britannia was my first taste of retail reality. It was loud, hot, and full of distribution puzzles no tutorial could prepare me for.'),
      ArticleBlock(ArticleBlockType.subheading, 'Top sales is a habit, not a talent'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The performers were rarely the fast talkers. They were the ones who turned up, counted accurately, and remembered that the shopkeeper is a customer with a problem, not a target.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Selling is about listening first and talking second.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Six months in, I understood that discipline is the quiet engine behind performance — a lesson I have never had to unlearn.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 6. What I Got from Idea Cellular
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'What I Got from Idea Cellular',
    slug: 'what-i-learned-at-idea-cellular',
    category: 'Career',
    date: DateTime(2024, 8, 1),
    excerpt:
      'My first real job taught me how organisations actually move — and that the best lessons come from the smallest tasks.',
    readingMinutes: 4,
    tags: ['telecom', 'first-job', 'career'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Idea Cellular was my first professional chapter — the place where work became a daily rhythm instead of a concept.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Telecom was a fast business in every sense: fast money, fast feet, fast talk. I learned to read the room, mirror the energy, and deliver what was asked before it was needed.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Your first job teaches you how to work before it teaches you what to work on.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Most of it was unglamorous. That is exactly why it built the discipline I still rely on.'),
    ],
  ),
// ---------------------------------------------------------------------------
  // 7. Why Dubai?
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Why Dubai?',
    slug: 'why-dubai',
    category: 'Career',
    date: DateTime(2024, 8, 20),
    excerpt:
        'Dubai is not just a location, it is a decision about how close you want to stand to the action.',
    readingMinutes: 5,
    featured: true,
    tags: ['dubai', 'career', 'international', 'uae'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Why Dubai? Because it is the live market that every direction of the region seems to run through. It is not just a place — it is a map of what is moving.'),
      ArticleBlock(ArticleBlockType.subheading, 'A town built on scenes'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Dubai rewards people who can operate across cultures at speed. For a marketer whose story touches motors, food, lifestyle and international markets, that overlap is the point.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'A good idea travels. Dubai is where I see that fastest.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'It changed how I think about opportunity: less about who you are, and more about who you can meet and what you can make.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 8. Job Hunt in UAE
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Job Hunt in UAE',
    slug: 'job-hunt-in-uae',
    category: 'Career',
    date: DateTime(2024, 9, 3),
    excerpt:
        'A job hunt is a marketing campaign with you as the brand. My version across the UAE pushed that lesson hard.',
    readingMinutes: 5,
    tags: ['uae', 'career', 'networking', 'job-hunt'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Looking for a job in the UAE is a masterclass in positioning. You are a brand with one page, one note and a very crowded shelf.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'I treated it like a campaign: define the audience, shape the message, pick the channel, and follow up like a professional. Networking, coffee and patience do more than any single application.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Every "no" is data for the next attempt.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The process humbled me, sharpened me, and proved it again: people hire people who are easy to want around the room.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 9. Selling Ricoh Printers
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Sales Techniques Selling Ricoh Printers',
    slug: 'selling-ricoh-printers-sales-techniques',
    category: 'Sales',
    date: DateTime(2024, 9, 25),
    excerpt:
        'Printers are the last thing anyone wants to hear about — until you talk value instead of features.',
    readingMinutes: 5,
    tags: ['sales', 'b2b', 'ricoh', 'consulting'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Selling Ricoh printers taught me the difference between a feature and a value, because nobody is emotionally attached to a photocopier.'),
      ArticleBlock(ArticleBlockType.subheading, 'Consult before you sell'),
      ArticleBlock(ArticleBlockType.paragraph,
          'You win by diagnosing: what does the customer actually run? Where do paper, ink and cost leak? Then the machine becomes the answer to a problem they already feel.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Feature talk is easy; value talk is hard and worth it.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Boring products make you stop selling the thing and start selling the outcome. That is the entire trick.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 10. Networking at Colosseum Gym
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Networking at Colosseum Gym',
    slug: 'networking-at-colosseum-gym',
    category: 'Sales',
    date: DateTime(2024, 10, 6),
    excerpt:
        'Some of the most useful conversations I ever had were never planned — they happened mid-set, at the gym.',
    readingMinutes: 4,
    tags: ['networking', 'sales', 'people'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'I did some of my most useful networking at Colosseum Gym — not over dinner, but standing between sets.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'A gym is a room of people who are present and consistent. That is rare, and it is an ideal setting for real connection and for quietly being helpful to someone.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Network as a person, not a business card.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The lesson stayed with me long after: start with the person, and the professional part follows naturally.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 11. Ubrik Media — The Shift from Sales to Marketing
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Ubrik Media — The Shift from Sales to Marketing',
    slug: 'ubrik-media-shift-from-sales-to-marketing',
    category: 'Marketing',
    date: DateTime(2024, 10, 18),
    excerpt:
        'The moment I stopped selling the product and started building the story behind it.',
    readingMinutes: 5,
    featured: true,
    tags: ['marketing', 'career', 'pivot', 'digital'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Ubrik Media is where I stopped selling a product and started shaping the message that made the sale inevitable.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The shift meant moving upstream in the funnel: positioning, messaging, digital — deciding not just what to say but where, to whom, and why they would believe it.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Marketing is the upstream of the sale.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'I never regretted the years in sales first. Selling made me a braver marketer — one who knows exactly what must happen once the story is finally heard.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 12. Marketing Orientation — Abbott Pharmaceuticals
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Marketing Orientation — Abbott Pharmaceuticals',
    slug: 'marketing-orientation-abbott-pharmaceuticals',
    category: 'Marketing',
    date: DateTime(2024, 11, 2),
    excerpt:
        'A window into how disciplined, evidence-led marketing works in a world of regulation and trust.',
    readingMinutes: 4,
    tags: ['marketing', 'healthcare', 'orientation'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'A marketing orientation with Abbott Pharmaceuticals showed me a world where you cannot stretch a fact — and how strong marketing thrives inside that constraint.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Pharma lives on compliance, evidence and trust. The markering is slower, more disciplined and far more deliberate, and that discipline was a privilege to observe up close.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Constraint is often the best brief a good idea ever gets.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'It strengthened a belief I still hold: marketing should serve the product, the evidence and the human being at the other end — in that order.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 13. ISD Global
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'ISD Global',
    slug: 'isd-global',
    category: 'Career',
    date: DateTime(2024, 11, 15),
    excerpt:
        'My first real international marketing exposure — and the first time I watched one idea work across markets.',
    readingMinutes: 4,
    tags: ['international', 'marketing', 'career'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'ISD Global is where marketing stopped being a domestic craft and became an international one for me.'),
      ArticleBlock(ArticleBlockType.subheading, 'First lesson: listen for context'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The language of marketing travels, but the context does not. I learned to listen for what each market actually cares about instead of repeating what worked at home.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Marketing language travels; context varies.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'That exposure shaped the international side of everything I do now. I can point to exactly where the switch happened.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 14. Photography & Brand Integration
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Photography Clientele — How to Integrate Brands and Keep It Alive',
    slug: 'photography-clientele-integrating-brands',
    category: 'Photography',
    date: DateTime(2024, 11, 28),
    excerpt:
        'Photography taught me to read a frame. Figuring out how to keep brands alive inside it was the next chapter.',
    readingMinutes: 5,
    tags: ['photography', 'brands', 'content', 'visual-storytelling'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Photography was where I first fell in love with story. Then clients started asking how a brand could live inside a frame without killing its honesty.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The honest answer: do not let the brand intrude — involve it in the scene. A product that belongs in a living picture will always beat a product dropped into an empty one.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Protect the truth of the frame; the brand earns the second look.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'From detail shots to interior storytelling, photography taught me light, timing and what to leave out — instincts I now pour straight into marketing.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 15. A Short Stint With Big Lessons — The Elite Cars
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'A Short Stint With Big Lessons — The Elite Cars',
    slug: 'a-short-stint-with-big-lessons-the-elite-cars',
    category: 'Automotive',
    date: DateTime(2024, 12, 8),
    excerpt:
        'A short run in luxury cars that taught me more about brands than many longer chapters ever could.',
    readingMinutes: 4,
    tags: ['automotive', 'luxury', 'supercars', 'career'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'The Elite Cars was a short, intense chapter in the automotive world — supercars, marques and the highest customer expectations I had yet encountered.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Luxury customers do not buy specifications. They buy confidence, exclusivity and care. Nail the experience across enough hand-offs and the perception is the sale — no push required.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Luxury is a service attitude. Price only confirms what experience already said.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'A short stint, big lessons, and a lasting love for what a well-told automotive story can do.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 16. 4 Years a Marketer at Stoub Biz Motors
  // ---------------------------------------------------------------------------
  BlogPost(
    title: '4 Years a Marketer at Stoub Biz Motors',
    slug: '4-years-a-marketer-at-stoub-biz-motors',
    category: 'Marketing',
    date: DateTime(2025, 1, 10),
    excerpt:
        'Four long years proving that, in automotive, the story and the consistency are the product.',
    readingMinutes: 6,
    featured: true,
    tags: ['automotive', 'marketing', 'stoub', 'photography'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Four years as the marketer behind Stoub Biz Motors is the chapter where automotive and storytelling became the same thing for me.'),
      ArticleBlock(ArticleBlockType.subheading, 'Campaigns, launches, events'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The work covered launches and events, but the core was a steady rhythm of content — photography and video that made the cars and the brand feel alive rather than merely advertised.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Consistency beats intensity. Show up regularly and well, and trust compounds.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'What I carried away: automotive marketing is half machine and half human, and the photograph is often the shortest path between the two.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 17. Automotive Tourism
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Automotive Tourism in Malaysia, Singapore and the Philippines',
    slug: 'automotive-tourism-malaysia-singapore-philippines',
    category: 'Travel',
    date: DateTime(2025, 3, 5),
    excerpt:
        'What happens when you point two of your obsessions — cars and travel — at the same place at once.',
    readingMinutes: 6,
    tags: ['travel', 'automotive', 'tourism', 'southeast-asia'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Automotive tourism is the cleanest proof I know that a machine can tell a story about a place. Cars, roads and racing culture are different in every country — and those differences are the point.'),
      ArticleBlock(ArticleBlockType.subheading, 'Malaysia → Singapore → Philippines'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Across Malaysia, Singapore and the Philippines the automotive cultures could not be more different: same engines, wholly different attitudes, roads and service traditions. Traveling between them is a masterclass in context.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Take the same passion abroad, and it teaches you what your market takes for granted.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'For me, automotive and travel are the same instinct: curiosity about how the world moves, and the will to photograph the moving.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 18. Why I Chose Pupil of Fate Motors
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Why I Chose Pupil of Fate Motors?',
    slug: 'why-i-chose-pupil-of-fate-motors',
    category: 'Career',
    date: DateTime(2025, 4, 12),
    excerpt:
        'Some moves are résumé-driven. This one was gut-driven, and I would make it again every time.',
    readingMinutes: 5,
    featured: true,
    tags: ['career', 'automotive', 'pupil-of-fate', 'choice'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'People ask why a seasoned marketer would choose a chapter called "Pupil of Fate Motors". The answer is honest: because it felt like a story I wanted to be part of.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'It would have been safer to chase the tidy title. But I have learned that the right chapter means more than the tidy one — when the culture, the purpose and the belief are right, the work being easy is a choice, not a gamble.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'The right chapter beats the tidy one. Choose work you can tell honestly.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'It is also the most honest thing I can tell young marketers: your best move is often the one your gut already made before your resume did.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 19. Building a Portfolio
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Building a Portfolio',
    slug: 'building-a-portfolio',
    category: 'Marketing',
    date: DateTime(2025, 4, 28),
    excerpt:
        'A portfolio is not a pile of work. It is a decision about which stories deserve to represent you.',
    readingMinutes: 5,
    tags: ['portfolio', 'personal-brand', 'storytelling', 'marketing'],
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'The hardest edit in your career is choosing what not to show. A portfolio that tries to show everything shows nothing — it has no story left.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'I now see a portfolio the way I see a brand: pick the audience, make a single clear promise, and let every piece of proof support that one promise sharply.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'You are the brand; your work is the proof.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Build it the way you would build a campaign you were proud of — deliberately, honestly and with a point of view.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 20. Beijing Auto Show
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Beijing Auto Show',
    slug: 'beijing-auto-show',
    category: 'Automotive',
    date: DateTime(2025, 6, 8),
    excerpt:
        'A mark chapter: the Beijing Auto Show — speed, spectacle and the whole global industry under one roof.',
    readingMinutes: 5,
    tags: ['automotive', 'auto-show', 'china', 'beijing'],
    heroImage: AssetPaths.beijingAutoShow,
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'The Beijing Auto Show is where a lot of automotive future gets announced at once. Walking it as a marketer is like reading the headlines of tomorrow — and seeing who is telling the smarter story.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The stands that pulled the crowd were rarely the loudest. They were the ones with a clear idea, a strong visual and a memorable narrative around the car.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'At a motor show, the product is the thing — but the story is the sale.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'It also reshaped what I believe about speed in this industry: China moves fast, and the rest of the world is still reading the manual.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 21. Canton Fair 2026
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Canton Fair 2026',
    slug: 'canton-fair-2026',
    category: 'Business',
    date: DateTime(2026, 4, 5),
    excerpt:
        'The largest trade fair on earth is a study in scale, selling and the stories brands tell when everyone is watching.',
    readingMinutes: 5,
    tags: ['business', 'trade-fair', 'china', 'canton-fair'],
    heroImage: AssetPaths.cantonFair2026,
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'The Canton Fair is an extraordinary machine: thousands of suppliers, tens of thousands of buyers, and every story crowded into a few days. Being there is a masterclass in cutting through noise.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The brands that won attention were the ones that understood something simple about trade: a buyer in a hurry wants confidence, not conversation. Clear, honest, instantly legible positioning wins.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'At scale, clarity becomes a competitive advantage.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Walking the fair it is impossible not to think about the whole supply of story and trust that moves the world.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 22. Bibigo Middle East
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Bibigo Middle East',
    slug: 'bibigo-middle-east',
    category: 'Marketing',
    date: DateTime(2025, 9, 2),
    excerpt:
        'Marketing a food brand across markets is the same craft as anything else — except the context is a flavour.',
    readingMinutes: 5,
    tags: ['marketing', 'bibigo', 'food', 'middle-east'],
    heroImage: AssetPaths.caseBibigo,
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          "Bibigo Middle East is part of the group's marketing story at Marketing Company FZE — food, motors and lifestyle under one narrative roof."),
      ArticleBlock(ArticleBlockType.paragraph,
          'A food brand is a beautiful test of marketing instincts: taste is personal, culture shapes preference, and the promise is always about more than the product.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'The group story is the true compounding asset.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'Working across Bibigo, Al Qubaisi, Novum, Al Khayyat and Ceramics taught me pattern recognition — different categories, same craft.'),
    ],
  ),

  // ---------------------------------------------------------------------------
  // 23. The Japanese Mindset — A Travel Log
  // ---------------------------------------------------------------------------
  BlogPost(
    title: 'Japanese Mindset — A Travel Log',
    slug: 'japanese-mindset-travelog',
    category: 'Travel',
    date: DateTime(2025, 10, 15),
    excerpt:
        'Japan is a study in how beautifully a culture can design for care, detail and respect — lessons a marketer should never forget.',
    readingMinutes: 6,
    tags: ['travel', 'japan', 'mindset', 'craft'],
    heroImage: AssetPaths.travelSeAsia,
    content: const [
      ArticleBlock(ArticleBlockType.paragraph,
          'Japan restores you the concept of craft. Every tray in a shop, every platform announcement, every detail setting is needle-tuned — and none of it needs to be loud.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'As a marketer you notice the restraint. The Japanese approach is often understatement done perfectly: the confidence that the work can carry itself instead of shouting-that is the premium.'),
      ArticleBlock(ArticleBlockType.pullQuote,
          'Restraint, done with intent, is the most premium thing a brand can do.'),
      ArticleBlock(ArticleBlockType.paragraph,
          'The travel log is personal, a quiet set of notes about what craft, care and a slightly slower pace can teach anyone who spends their life trying to be heard.'),
    ],
  ),
];