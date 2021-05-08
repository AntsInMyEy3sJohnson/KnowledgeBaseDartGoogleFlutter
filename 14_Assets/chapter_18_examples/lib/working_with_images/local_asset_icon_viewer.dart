import 'package:flutter/material.dart';

class LocalAssetIconViewer extends StatelessWidget {

  const LocalAssetIconViewer();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(width: 128, height: 128),
        child: Image(
          image: AssetImage("assets/icons/flutter.png"),
        ),
      ),
    );
  }


}