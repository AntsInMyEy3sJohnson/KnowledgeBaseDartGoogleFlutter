import 'package:chapter_13_examples/manual_internationalization/localization/localization_delegate.dart';
import 'package:chapter_13_examples/manual_internationalization/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(MyApp());
}

// Most important aspects to consider for localization:
// * Displaying text (on buttons and text fields, for example) in the correct language
// * Converting prices to the correct currency
// * Display times in the correct format (24h vs 12h format)
// * If the business logic relies, at least partially, on time, time zones might
// have to be taken into account
//
// Basic approach: Implement internationalization manually. Less implementation time
// and simpler to use, but only translates strings.
// Advanced approach: Use 'intl' package provider by Flutter to support users with
// localization and internationalization tasks. Comes with more control over
// plurals, nouns, first- vs. third person etc, but requires some configuration to
// set up.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ManualLocalizationMaterialApp();
  }
}

class ManualLocalizationMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manual Localization And Internationalization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        const AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale.fromSubtags(languageCode: "en"),
        Locale.fromSubtags(languageCode: "de"),
      ],
      home: Scaffold(
        body: Center(
          child: LocalizedText(),
        ),
      ),
    );
  }
}

// Making use of a LocalizationDelegate has to happen, in terms of the
// widget tree, below the widget that defines the delegates. Otherwise,
// the 'AppLocalization.of(context)' will yield null.
class LocalizedText extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Text("${context.localize(Keys.battleship)}");
  }

}
