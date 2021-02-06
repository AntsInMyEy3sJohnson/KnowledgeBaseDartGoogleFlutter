import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dart_files/messages_all.dart';class AppLocalization2 {

  final Locale locale;

  const AppLocalization2(this.locale);

  static AppLocalization2 of(BuildContext context) =>
    Localizations.of<AppLocalization2>(context, AppLocalization2);

  /*
  * Generation of .arb language files using the following command:
  *
  * flutter pub run intl_translation:extract_to_arb \
  * --output-dir=lib/internationalization_using_intl/localization/arb_files \
  * lib/internationalization_using_intl/localization/app_localization_2.dart
  *
  * Will generate 'intl_messages.arb' file that can be used as a template for
  * the various locales. Within each locale arb file ('intl_en.arb', for example),
  * the value for each key has to be changed according to the language indicated
  * by the locale code.
  *
  * Once the desired arb files are in place, the following command can be used
  * to generate the corresponding dart files:
  * flutter pub run intl_translation:generate_from_arb \                                                                                                                                                                                      ─╯
  * --output-dir=lib/internationalization_using_intl/localization/dart_files \
  * --no-use-deferred-loading \
  * lib/internationalization_using_intl/localization/app_localization_2.dart \
  * lib/internationalization_using_intl/localization/arb_files/intl_en.arb \
  * lib/internationalization_using_intl/localization/arb_files/intl_de.arb
  *
  * Among others, this will generate a file called 'messages_all.dart' containing
  * the 'initializeMessages()' method.
  *
  * */
  static Future<AppLocalization2> load(Locale locale) async {
    final String localeName = Intl.canonicalizedLocale(locale.languageCode);

    await initializeMessages(localeName);

    Intl.defaultLocale = localeName;

    return AppLocalization2(locale);

  }

  // The 'name' parameter corresponds to the precise name of the getter returning
  // the string to be localized
  String get hello => Intl.message("Hello", name: "hello");

  String get helloWorld => Intl.message("Hello world", name: "helloWorld");

  String get battleship => Intl.message("Battleship", name: "battleship");

}

extension LocalizationExtension2 on BuildContext {

  AppLocalization2 get localizeUsingIntl => AppLocalization2.of(this);

}