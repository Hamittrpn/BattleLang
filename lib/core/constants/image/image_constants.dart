class ImageConstants {
  static ImageConstants? _instance;
  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  //png
  String get splashImage => toPng("ic_splash_400");
  String get friends => toPng("ic_friends");
  String get challengeInfo => toPng("ic_challenge_info");
  String get points => toPng("ic_points");

  //jpeg
  String get challengeBanner1 => toJpeg("ic_challange1");
  String get challengeBanner2 => toJpeg("ic_challange2");
  String get challengeBanner3 => toJpeg("ic_challange3");
  String get challengeBanner4 => toJpeg("ic_challange4");
  String get challengeBanner5 => toJpeg("ic_challange5");
  String get challengeBanner6 => toJpeg("ic_challange6");
  String get challengeBanner7 => toJpeg("ic_challange7");
  String get user1 => toJpeg("ic_user1");
  String get user2 => toJpeg("ic_user2");
  String get user3 => toJpeg("ic_user3");

  //svg
  String get onboardImage1 => toSVG("ic_onboarding1");
  String get onboardImage2 => toSVG("ic_onboarding2");
  String get onboardImage3 => toSVG("ic_onboarding3");

  //animation
  String get forgotPassword => toLottie("anim_forgot_password");
  String get connectivity => toLottie("anim_connectivity");

  String toPng(String name) => "assets/image/$name.png";
  String toJpeg(String name) => "assets/image/$name.jpeg";
  String toSVG(String name) => "assets/svg/$name.svg";
  String toLottie(String name) => "assets/animation/$name.json";
}
