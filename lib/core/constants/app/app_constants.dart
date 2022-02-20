// ignore_for_file: constant_identifier_names
class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants get instance =>
      _instance ??= ApplicationConstants._init();
  ApplicationConstants._init();

  static const LANG_ASSET_PATH = "assets/lang";
  static const COMPANYNAME = "BATTLELANG";
  static const EMAIL_REGEX = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$";
  static const FONT_FAMILY = "DM Sans";
  static const Duration defaultDuration = Duration(microseconds: 300);

  final String baseUrl = 'https://fakestoreapi.com/';
}

double kZero = 0;
double kOne = 1;
