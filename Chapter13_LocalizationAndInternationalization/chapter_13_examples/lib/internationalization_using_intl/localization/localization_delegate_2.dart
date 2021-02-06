import 'package:chapter_13_examples/internationalization_using_intl/localization/app_localization_2.dart';
import 'package:flutter/material.dart';

class AppLocalizationDelegate2 extends LocalizationsDelegate<AppLocalization2> {
  const AppLocalizationDelegate2();

  @override
  bool isSupported(Locale locale) => ["en", "de"].contains(locale.languageCode);

  @override
  Future<AppLocalization2> load(Locale locale) => AppLocalization2.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization2> old) =>
      false;
}
