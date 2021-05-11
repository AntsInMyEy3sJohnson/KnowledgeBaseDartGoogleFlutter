import 'package:chapter_19_examples/forms_and_validation/login_form.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  const Layout();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimensions) {
        // By relying on the dimensions property, the aspect ratio will be
        // consistent regardless of the available space and the device's
        // orientation
        final width = dimensions.maxWidth / 1.2;
        final height = dimensions.maxHeight / 3;

        return Center(
          // The problem with this simple approach is that if the keyboard
          // moves up, the decreased space available to display widgets might
          // cause parts of those widgets to overflow.
          // child: _withPotentialOverflow(width, height),
          // First solution approach: The widget that overflows once the keyboard
          // is shown can be made scrollable by wrapping it in a 'SingleChildScrollView'
          // Another option is to set the 'resizeToAvoidBottomInset' property on the
          // enclosing Scaffold to 'false', which will simply display the keyboard
          // on top of the widgets instead of moving them upwards. This is not ideal,
          // however, as it most often hides just the input elements the user types in
          // Generally: Wrap a widget inside a 'SingleChildScrollView' whenever
          // unsure whether there will always be enough space to display it completely
          child: _overflowAddressedByScroll(width, height),
        );
      },
    );
  }


  Widget _overflowAddressedByScroll(double width, double height) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: width,
          maxHeight: height,
        ),
        child: const LoginForm(),
      ),
    );
  }

  Widget _withPotentialOverflow(double width, double height) {
    // If additional styling or some cool effects are desired,
    // use a Container rather than a SizedBox
    return SizedBox(
      width: width,
      height: height,
      child: const LoginForm(),
    );
  }
}
