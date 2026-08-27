import '../core/constants/asset_paths.dart';
import '../models/experience.dart';

/// The career timeline (Story page + homepage Story Preview).
/// Ordered oldest → newest.
const List<Experience> experiences = [
  Experience(
    id: 'ifim',
    organization: 'IFIM Business School',
    role: 'Student • President',
    period: 2009,
    periodLabel: 'Business School',
    headline: 'Where it all began',
    summary:
        'Business school taught me more than the syllabus. It gave me my first taste of leading people, of selling an idea, and the discipline it takes to finish a research project properly.',
    achievements: const [
      'Pepsi — my first marketing campaign project',
      'President of the student council',
      'The "All Rounder" label classmates gave me',
      'Case-study competitions & research papers',
    ],
    lessons: const [
      'Convincing people to believe in an idea is a skill — and it can be learned.',
      'The best projects come from passionate small teams, not big budgets.',
    ],
    focus: const ['Leadership', 'Marketing basics', 'Sales foundations'],
    imagePath: AssetPaths.storyIfim,
  ),
  Experience(
    id: 'britannia',
    organization: 'Britannia',
    role: 'Sales',
    period: 2010,
    periodLabel: 'First Taste of Sales',
    headline: 'Top Sales',
    summary:
        'My first real stretch in sales. Britannia taught me the fundamentals that still shape how I think about customers, distribution and performance.',
    achievements: const ['Top sales performer in my stint'],
    lessons: const [
      'Selling is about listening first, talking second.',
      'Discipline is the quiet engine behind performance.',
    ],
    focus: const ['Sales', 'Customers', 'Performance', 'Discipline'],
    imagePath: AssetPaths.storyBritannia,
  ),
  Experience(
    id: 'idea',
    organization: 'Idea Cellular',
    role: 'First Job',
    period: 2011,
    periodLabel: 'First Job',
    headline: 'Entering professional life',
    summary:
        'My first real job. It taught me how organisations actually work — the rhythms, the reporting, the conversations that move things — and shaped how I carried myself from then on.',
    achievements: const ['First formal job in a fast-moving telecom business'],
    lessons: const [
      'Show up early, stay curious, ask the obvious question.',
      'Your first job teaches you how to work before it teaches you what to work on.',
    ],
    focus: const ['Professional discipline', 'Telecom', 'The working world'],
    imagePath: AssetPaths.storyIdea,
  ),
  Experience(
    id: 'graphic',
    organization: 'Graphic International',
    role: 'Career Development',
    period: 2012,
    periodLabel: 'Career Development',
    headline: 'Selling Ricoh printers',
    summary:
        'A period of sharpening my sales craft — understanding products, qualifying genuine needs and closing without pressure. Ricoh printers were my classroom.',
    achievements: const [
      'Sales techniques selling Ricoh printers',
      'Learning to consult before you sell',
    ],
    lessons: const [
      'Feature talk is easy; value talk is hard and worth it.',
    ],
    focus: const ['B2B sales', 'Consultative selling'],
    imagePath: AssetPaths.storyIdea,
  ),
  Experience(
    id: 'ubrik',
    organization: 'Ubrik Media',
    role: 'Sales → Marketing',
    period: 2013,
    periodLabel: 'The Shift',
    headline: 'The shift from sales to marketing',
    summary:
        'Ubrik Media is where the switch happened. I moved from selling a product to shaping the message behind it — positioning, storytelling and digital. The beginning of my life as a marketer.',
    achievements: const ['Led the shift from sales to marketing'],
    lessons: const [
      'Marketing is the upstream of the sale.',
      'Having sold makes you a sharper marketer.',
    ],
    focus: const ['Digital marketing', 'Positioning', 'Brand messaging'],
    imagePath: AssetPaths.storyUbrik,
  ),
  Experience(
    id: 'isd',
    organization: 'ISD Global',
    role: 'International Marketing',
    period: 2014,
    periodLabel: 'International Exposure',
    headline: 'Working across borders',
    summary:
        'My first real international marketing exposure. I learned to think across markets, time zones and cultural cues — and that a good idea travels surprisingly well.',
    achievements: const ['International marketing exposure & experience'],
    lessons: const [
      'Marketing language travels; context varies.',
      'Listen for what every market actually cares about.',
    ],
    focus: const ['International markets', 'Cross-cultural work'],
    imagePath: AssetPaths.storyIsd,
  ),
  Experience(
    id: 'elite',
    organization: 'The Elite Cars',
    role: 'Luxury Automotive',
    period: 2016,
    periodLabel: 'Short Stint, Big Lessons',
    headline: 'Luxury, supercars, Jetour',
    summary:
        'My first deep dip into the automotive world — supercars, premium marques and customers whose expectations were the highest I had met. A short stint, big lessons.',
    achievements: const [
      'Jetour, supercars & luxury automotive',
      'Premium customer experience',
    ],
    lessons: const [
      'Luxury is a service attitude, not a product label.',
      'Marketing sits inside every part of the experience.',
    ],
    focus: const ['Luxury automotive', 'Supercars', 'Premium experience'],
    imagePath: AssetPaths.storyEliteCars,
  ),
  Experience(
    id: 'stoub',
    organization: 'Stoub Biz Motors',
    role: 'Head of Marketing',
    period: 2019,
    periodLabel: '2019 – 2023',
    headline: 'Four years as a marketer',
    summary:
        'A major chapter. Four years owning automotive marketing — campaigns, launches, events and content — discovering that photography and video were the most powerful storytellers in the garage.',
    achievements: const [
      '4 years running automotive marketing',
      'Campaigns, launches, events & content',
      'Photography as a core marketing tool',
    ],
    lessons: const [
      'Consistency beats intensity — show up regularly and well.',
      'Automotive marketing is half car, half human.',
    ],
    focus: const ['Automotive marketing', 'Campaigns', 'Content'],
    imagePath: AssetPaths.storyStoub,
    major: true,
  ),
  Experience(
    id: 'pupil',
    organization: 'Pupil of Fate Motors',
    role: 'Marketing Lead',
    period: 2023,
    periodLabel: 'A New Chapter',
    headline: 'Why I chose Pupil of Fate Motors',
    summary:
        'Some moves are résumé-driven; this one was gut-driven. I chose a company, a culture and a story that felt worth being part of. That choice says more about how I work than any title could.',
    achievements: const [
      'Led marketing for a new automotive chapter',
      'A bet on story, culture and craft',
    ],
    lessons: const [
      'The right chapter beats the tidy one.',
      'Choose work you can tell honestly.',
    ],
    focus: const ['Brand marketing', 'Automotive', 'Storytelling'],
    imagePath: AssetPaths.storyPupil,
  ),
  Experience(
    id: 'fze',
    organization: 'Marketing Company FZE',
    role: 'Marketing & Brand',
    period: 2024,
    periodLabel: 'Most Recent',
    headline: 'A portfolio of brands',
    summary:
        'Working across a group of brands — Bibigo Middle East, Al Qubaisi, Novum, Al Khayyat and Ceramics — spanning food, motors and lifestyle. The most international, most diverse chapter yet.',
    achievements: const [
      'Bibigo Middle East',
      'Al Qubaisi',
      'Novum',
      'Al Khayyat',
      'Ceramics',
    ],
    lessons: const [
      'Running multiple brands builds pattern recognition.',
      'A strong story is the asset every brand still needs.',
    ],
    focus: const ['Multi-brand marketing', 'Group storytelling'],
    imagePath: AssetPaths.storyFze,
    major: true,
  ),
];