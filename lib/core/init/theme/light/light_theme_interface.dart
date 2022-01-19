import 'color_sheme_light.dart';
import 'text_theme_light.dart';

abstract class ILightTheme {
  TextThemeLight textThemeLight = TextThemeLight.instance;
  ColorShemeLight colorShemeLight = ColorShemeLight.instance;
}
