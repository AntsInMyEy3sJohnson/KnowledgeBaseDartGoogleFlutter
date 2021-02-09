import 'package:chapter_14_examples/animation_library/logo_spinner.dart';
import 'package:chapter_14_examples/implicit_animations/animated_container_scaffold.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chapter 14 Examples',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const AnimationLibraryHome(),
    );
  }
}

class AnimationLibraryHome extends StatelessWidget {

  const AnimationLibraryHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Animation Library"),
      ),
      body: const Center(
        child: LogoSpinner(),
      ),
    );
  }

}

/// Important implicitly animated widgets:
/// * AnimatedContainer
/// * AnimatedAlign
/// * AnimatedOpacity (Relatively expensive in terms of
/// performance, so use with caution)
/// * AnimatedDefaultTextStyle
/// * AnimatedPadding
/// * AnimatedPhysicalModel
/// * AnimatedPositioned (only works when inside a stack)
/// * AnimatedCrossFade
/// * AnimatedSize
/// * AnimatedIcon
class ImplicitAnimationHome extends StatelessWidget {
  const ImplicitAnimationHome();

  @override
  Widget build(BuildContext context) {
    return const AnimatedContainerScaffold();
  }
}
