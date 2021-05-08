import 'package:chapter_18_examples/working_with_images/local_asset_icon_viewer.dart';
import 'package:flutter/material.dart';

void main() {

  // Any Flutter app exposes a so-called 'rootBundle' object that enables
  // developers to quickly and easily load assets. The 'rootBundle' object
  // should not be used inside widgets (regardless if the widget is a
  // 'StatelessWidget' or a 'StatefulWidget').
  // In case an asset absolutely needs to be retrieved from within a widget,
  // use the 'DefaultAssetBundle' class:
  // DefaultAssetBundle.of(context).loadString("myAsset")

  // When loading images or icons, Flutter is able to pick the appropriate one
  // in terms of size automatically. Therefore, it always make sense to specify
  // multiple versions of the same image or icon. To make this feature work, though,
  // the various image or icon versions have to be equally named, and they have to
  // be placed in folders carrying specific names, too. Examples:
  // myicons/icon.png
  // myicons/2.0x/icon.png
  // myicons/3.0x/icon.png
  // In this example, Flutter is provided with three variants of the same icon (the
  // fact that it's the same icon is expressed by the equal naming, and in the code
  // loading the asset, the icon can simply be specified with 'icon.png' as usual),
  // and the two sub-folders indicate the different ratios the icon is available for.
  // It's important the icon variants obey the ratio indicated by their parent
  // folder -- for example, the icon contained in the '2.0x' folder should have
  // twice the size as the root icon.

  // A note on storing and loading JSON assets: Storing data in plain JSON files
  // and loading them as assets is not too common within the Flutter world -- rather,
  // try to place them in shared preferences or in some database shipped with the app,
  // or query them from a web service.

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 18 Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: const LocalAssetIconViewer(),
      )
    );
  }
}
