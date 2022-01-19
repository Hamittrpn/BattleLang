class ImageConstants {
  static ImageConstants? _instance;

  static ImageConstants get instance => _instance ??= ImageConstants._init();

  ImageConstants._init();

  //png
  String get splashImage => toPng("ic_splash_400");

  //svg
  String get onboardImage1 => toSVG("ic_onboarding1");
  String get onboardImage2 => toSVG("ic_onboarding2");
  String get onboardImage3 => toSVG("ic_onboarding3");

  String toPng(String name) => "assets/image/$name.png";
  String toSVG(String name) => "assets/svg/$name.svg";
}
