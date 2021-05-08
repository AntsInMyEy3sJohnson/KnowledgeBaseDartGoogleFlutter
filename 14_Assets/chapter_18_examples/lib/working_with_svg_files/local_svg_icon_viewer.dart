import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocalSvgIconViewer extends StatelessWidget {
  const LocalSvgIconViewer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        // Note that SVG files containing the '<style>' element are not
        // compatible with the 'flutter_svg' package, and may not be properly
        // rendered --> Use pre-processing utility such as 'svgcleaner' to inline
        // styles in case an SVG file contains the '<style>' tag
        child: SvgPicture.asset(
          // Can also be used to download an SVG file from a URL by simply
          // providing the file URL
          "assets/icons/flutter.svg",
          width: 256,
          height: 256,
          fit: BoxFit.fill,
          alignment: Alignment.center,
          placeholderBuilder: (_) => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
