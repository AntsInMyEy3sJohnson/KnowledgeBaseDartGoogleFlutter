import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions) {
        // By relying on the dimensions property, the aspect ratio will be
        // consistent regardless of the available space and the device's
        // orientation
        final width = dimensions.maxWidth / 1.5;
        final height = dimensions.maxHeight / 3;

        return Center(
          // If additional styling or some cool effects are desired,
          // use a Container rather than a SizedBox
          child: SizedBox(
            width: width,
            height: height,
            child: const Text("Implement me"),
          ),
        );
      },
    );
  }
}
