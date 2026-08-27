import '../core/constants/asset_paths.dart';
import '../models/guest_talk.dart';

/// Guest talks — PLACEHOLDERS. No talks or links have been invented.
///
/// Replace each entry with a real event. When `link` is empty, the card shows
/// "Details to be added" instead of a broken external link.
const List<GuestTalk> guestTalks = [
  GuestTalk(
    event: 'Talks & Speaking',
    topic: 'Automotive Brand Storytelling',
    location: 'To be confirmed',
    date: 'TBC',
    description:
        'A place for a talk on telling stories about cars, brands and the people who buy both. Replace this placeholder with the details of a real appearance.',
    imagePath: AssetPaths.guestTalk01,
  ),
  GuestTalk(
    event: 'Talks & Speaking',
    topic: 'Marketing Across Markets',
    location: 'To be confirmed',
    date: 'TBC',
    description:
        'A placeholder for a conversation on taking marketing across borders — culture, context and the stories that travel. Replace with a real event.',
    imagePath: AssetPaths.guestTalk02,
  ),
  GuestTalk(
    event: 'Talks & Speaking',
    topic: 'Sales to Marketing: The Shift',
    location: 'To be confirmed',
    date: 'TBC',
    description:
        'A placeholder for a talk on the journey from selling to marketing — and why doing both makes you better at each. Replace with a real event.',
    imagePath: '',
  ),
];

/// Testimonials — PLACEHOLDERS.
///
/// No testimonial, name, quote or company has been fabricated. These cards are
/// clearly marked "placeholder" and show the exact shape copy is expected there.
/// Replace with real, approved quotes (name, designation, company, optional photo).
const List<Testimonial> testimonialPlaceholders = [
  Testimonial(
    quote:
        'Replace this with a real, approved quote about working with Nikhil. Nothing here is fabricated.',
    person: 'Your Name Placeholder',
    designation: 'Role Placeholder',
    company: 'Company Placeholder',
  ),
  Testimonial(
    quote:
        'A second real, approved quote goes here. Use the model fields: quote, person, designation, company, optional imagePath.',
    person: 'Name Placeholder 2',
    designation: 'Role Placeholder 2',
    company: 'Company Placeholder 2',
  ),
  Testimonial(
    quote:
        'A third real, approved quote goes here. Short, specific and in the person\'s own voice reads best.',
    person: 'Name Placeholder 3',
    designation: 'Role Placeholder 3',
    company: 'Company Placeholder 3',
  ),
];