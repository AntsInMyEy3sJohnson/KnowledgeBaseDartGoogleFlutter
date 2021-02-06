import 'package:chapter_13_examples/manual_internationalization/localization/app_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "de"].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) =>
      // Caution: In general, avoid making use of 'SynchronousFuture'
      SynchronousFuture<AppLocalization>(AppLocalization(locale));

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      // Reloading is almost never required -- return 'false' by default
      false;
}
