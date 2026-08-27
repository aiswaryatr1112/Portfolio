/// Central registry of every image asset referenced anywhere in the app.
///
/// Keep paths in ONE place so renaming a file never means hunting through UI
/// code. Filenames follow the convention set out in the brief
/// (profile_main.jpg, story_ifim.jpg, case_pepsi.jpg, …).
///
/// An empty value means "no asset supplied yet" — the UI then renders a
/// clearly-labelled editorial placeholder instead of a broken image.
class AssetPaths {
  AssetPaths._();

  static const String profileMain = ''; // assets/images/profile/profile_main.jpg
  static const String profilePortrait = ''; // assets/images/profile/profile_portrait.jpg
  static const String profileAbout = ''; // assets/images/profile/profile_about.jpg

  // Career markers
  static const String storyIfim = ''; // assets/images/profile/story_ifim.jpg
  static const String storyBritannia = ''; // story_britannia.jpg
  static const String storyIdea = ''; // story_idea.jpg
  static const String storyUbrik = ''; // story_ubrik.jpg
  static const String storyIsd = ''; // story_isd.jpg
  static const String storyEliteCars = ''; // story_elite_cars.jpg
  static const String storyStoub = ''; // story_stoub.jpg
  static const String storyPupil = ''; // story_pupil.jpg
  static const String storyFze = ''; // story_fze.jpg

  // Automotive / travel
  static const String automotive01 = ''; // assets/images/automotive/automotive_01.jpg
  static const String automotiveSupercar = ''; // automotive_supercar.jpg
  static const String automotiveLaunch = ''; // automotive_launch.jpg
  static const String beijingAutoShow = ''; // beijing_auto_show.jpg
  static const String cantonFair2026 = ''; // canton_fair_2026.jpg
  static const String travelSeAsia = ''; // travel_se_asia.jpg

  // Case studies
  static const String casePepsi = ''; // assets/images/case-studies/case_pepsi.jpg
  static const String caseStoub = ''; // case_stoub.jpg
  static const String caseElite = ''; // case_elite.jpg
  static const String caseBibigo = ''; // case_bibigo.jpg

  // Guest talks
  static const String guestTalk01 = ''; // assets/images/guest-talks/guest_talk_01.jpg
  static const String guestTalk02 = ''; // guest_talk_02.jpg

  // Blog
  static const String blogPepsi = ''; // assets/images/blog/blog_pepsi.jpg
  static const String blogWhyDubai = ''; // blog_why_dubai.jpg
  static const String blogStoub = ''; // blog_stoub.jpg
  static const String blogPupil = ''; // blog_pupil.jpg

  static const String miscPerforation = ''; // assets/images/misc/perforation.jpg
}