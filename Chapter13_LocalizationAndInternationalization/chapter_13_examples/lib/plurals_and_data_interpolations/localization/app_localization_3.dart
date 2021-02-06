import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart_files/messages_all.dart';

class AppLocalization3 {
  final Locale locale;

  const AppLocalization3(this.locale);

  static AppLocalization3 of(BuildContext context) =>
      Localizations.of<AppLocalization3>(context, AppLocalization3);

  static Future<AppLocalization3> load(Locale locale) async {
    final String localeName = Intl.canonicalizedLocale(locale.languageCode);

    await initializeMessages(localeName);

    Intl.defaultLocale = localeName;

    return AppLocalization3(locale);
  }

  String remainingCookies(int cookies) => Intl.plural(
        cookies,
        zero: "No cookies remaining",
        one: "Only one cookie left",
        other: "$cookies cookies remaining",
        name: "remainingCookies",
        args: [cookies],
      );

  String get hello => Intl.message("Hello", name: "hello");

  String get helloWorld => Intl.message("Hello world", name: "helloWorld");

  String get battleship => Intl.message("Battleship", name: "battleship");
}

extension LocalizationExtension3 on BuildContext {
  AppLocalization3 get localizedPlural => AppLocalization3.of(this);
}
