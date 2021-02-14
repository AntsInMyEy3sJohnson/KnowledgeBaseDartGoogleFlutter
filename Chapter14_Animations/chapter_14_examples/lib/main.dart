import 'package:chapter_14_examples/animation_library/animatedbutton/button_animator.dart';
import 'package:chapter_14_examples/custom_animations/moving_button/moving_button.dart';
import 'package:chapter_14_examples/custom_animations/rotating_container/rotating_container.dart';
import 'package:chapter_14_examples/implicit_animations/animated_container_scaffold.dart';
import 'package:flutter/material.dart';

/// Some best practices when working with animations:
///
/// Use implicit animation wherever possible
/// * Counterparts of non-animated Flutter widgets, such as 'AnimatedContainer',
/// 'AnimatedAlign', 'AnimatedOpacity', and so on
/// * Easy to set up and use, but not as flexible as AnimatedBuilder
/// * Apart from being animated, the implicit animation widgets work in exactly
/// the same way as their non-animated counterparts
///
/// If a widget to be used does not have an implicit animation counterpart,
/// go for AnimatedBuilder -- using AnimatedWidget directly is possible, too,
/// but requires more boilerplate code
///
/// Optimize animations as inefficient animation use can lead to frame rate drops
/// in the app
/// * Make use of 'const' constructors as often as possible in order to avoid
/// unnecessary rebuilds
/// * If a 'const' constructor is not an option, try to cache the widget sub tree
/// in question within a 'final' variable or put it inside an AnimatedBuilder (which
/// does precisely that)
///
/// AnimationController's default behavior of emitting values between 0.0 and 1.0
/// can be altered or enriched
/// * Use 'CurvedAnimation', 'ReverseAnimation' and the likes to put additional
/// behavior on top of a plain AnimationController
/// * Use 'Tween<T>' to make the AnimationController emit different kinds of
/// values altogether
///
/// The world of custom animations is vast and complex, but there is no need to
/// know all of it -- most animations needs can nicely be covered using only
/// three classes: AnimationController, Stack, Transform
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
        // child: const RotatingContainer(),
        child: const MovingButton(),
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
