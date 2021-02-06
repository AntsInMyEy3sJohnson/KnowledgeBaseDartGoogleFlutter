import 'package:chapter_13_examples/plurals_and_data_interpolations/localization/app_localization_3.dart';
import 'package:flutter/material.dart';

class AppLocalizationDelegate3 extends LocalizationsDelegate<AppLocalization3> {
  const AppLocalizationDelegate3();

  @override
  bool isSupported(Locale locale) => ["en", "de"].contains(locale.languageCode);

  @override
  Future<AppLocalization3> load(Locale locale) => AppLocalization3.load(locale);

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization3> old) =>
      false;
}
