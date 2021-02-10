import 'package:chapter_14_examples/animation_library/animatedbutton/button_animator.dart';
import 'package:chapter_14_examples/custom_animations/rotating_container.dart';
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
      // home: const AnimationLibraryHome(),
      home: const CustomAnimationHome(),
    );
  }
}

// To create complex animations is a matter of mastering the interplay between
// the following three classes:
// * AnimationController: Produces values within a preconfigured range with a
// certain interval in order to animate a widget.
// * Transform: Alters the aspect of a widget using matrices (scaling, rotation,
// skew, ...)
// * Stack: Used to overlap series of children on top one another. Custom positioning
// by means of the 'Positioned' widget.
class CustomAnimationHome extends StatelessWidget {
  const CustomAnimationHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Animations"),
      ),
      body: const Center(
        child: const RotatingContainer(),
      ),
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
        // child: LogoSpinner(),
        child: ButtonAnimator(),
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
