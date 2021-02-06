import 'package:flutter/material.dart';

class AppLocalization {
  final Locale locale;

  const AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Map<String, Map<Keys, String>> _db = {
    "en": {
      Keys.hello: "Hello",
      Keys.hello_world: "Hello world",
      Keys.battleship: "Battleship",
    },
    "de": {
      Keys.hello: "Guten Tag",
      Keys.hello_world: "Hallo Welt",
      Keys.battleship: "Schlachtschiff",
    }
  };
}

// Extension method to be invoked right on the BuildContext itself
extension LocalizationExtension on BuildContext {
  String localize(Keys k) {
    final localeCode = AppLocalization.of(this).locale.languageCode ?? "en";
    final database = AppLocalization._db;

    if (database.containsKey(localeCode)) {
      return database[localeCode][k];
    } else {
      return database["en"][k];
    }
  }
}

enum Keys { hello, hello_world, battleship }
