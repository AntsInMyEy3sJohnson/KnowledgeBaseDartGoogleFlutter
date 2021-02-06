import 'package:chapter_13_examples/internationalization_using_intl/localization/app_localization_2.dart';
import 'package:chapter_13_examples/internationalization_using_intl/localization/localization_delegate_2.dart';
import 'package:chapter_13_examples/manual_internationalization/localization/app_localization.dart';
import 'package:chapter_13_examples/manual_internationalization/localization/localization_delegate.dart';
import 'package:chapter_13_examples/plurals_and_data_interpolations/localization/app_localization_3.dart';
import 'package:chapter_13_examples/plurals_and_data_interpolations/localization/localization_delegate_3.dart';
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
    // return const ManualLocalizationMaterialApp();
    // return const LocalizationUsingIntelMaterialApp();
    return const PluralAndDataInterpolationMaterialApp();
  }
}

class PluralAndDataInterpolationMaterialApp extends StatelessWidget {
  const PluralAndDataInterpolationMaterialApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plural And String Interpolation",
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        const AppLocalizationDelegate3(),
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
          child: const CookiesCounter(),
        ),
      ),
    );
  }
}

class CookiesCounter extends StatefulWidget {
  const CookiesCounter();

  @override
  _CookiesCounterState createState() => _CookiesCounterState();
}

class _CookiesCounterState extends State<CookiesCounter> {

  int _numCookies = 5;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${context.localizedPlural.remainingCookies(_numCookies)}"),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                    child: const Text("Buy Cookie"),
                    onPressed: () {
                      setState(() {
                        _numCookies = _buyCookie(_numCookies);
                      });
                    }),
                RaisedButton(
                    child: const Text("Eat Cookie"),
                    onPressed: () {
                      setState(() {
                        _numCookies = _eatCookie(_numCookies);
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int _buyCookie(int currentNumCookies) {
    return currentNumCookies + 1;
  }

  int _eatCookie(int currentNumCookies) {
    if (currentNumCookies > 0) {
      return currentNumCookies - 1;
    }
    return currentNumCookies;
  }
}

class LocalizationUsingIntelMaterialApp extends StatelessWidget {
  const LocalizationUsingIntelMaterialApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Using The 'intl' Package",
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: [
        const AppLocalizationDelegate2(),
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
          child: const LocalizedText2(),
        ),
      ),
    );
  }
}

class LocalizedText2 extends StatelessWidget {
  const LocalizedText2();

  @override
  Widget build(BuildContext context) {
    return Text("${context.localizeUsingIntl.helloWorld}");
  }
}

class ManualLocalizationMaterialApp extends StatelessWidget {
  const ManualLocalizationMaterialApp();

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
          child: const LocalizedText(),
        ),
      ),
    );
  }
}

// Making use of a LocalizationDelegate has to happen, in terms of the
// widget tree, below the widget that defines the delegates. Otherwise,
// the 'AppLocalization.of(context)' will yield null.
class LocalizedText extends StatelessWidget {
  const LocalizedText();

  @override
  Widget build(BuildContext context) {
    return Text("${context.localizeManually(Keys.battleship)}");
  }
}
