import 'dart:ui';

class LanguageManager {
  static LanguageManager? _instance;

  static LanguageManager get instance {
    return _instance ??= LanguageManager._init();
  }

  LanguageManager._init();

  final enLocale = const Locale("en", "US");
  final trLocale = const Locale("tr", "TR");
  List<Locale> get supportedLocales => [enLocale, trLocale];
}
