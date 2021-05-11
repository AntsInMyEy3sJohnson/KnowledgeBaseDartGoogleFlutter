import 'package:chapter_19_examples/forms_and_validation/validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm();

  // We need a global key to uniquely identify the form under validation
  // in the widget tree
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _key = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // Remember to dispose of those controllers!
    _mailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                // By setting this to an empty string, we can prevent the counter
                // from showing up
                counterText: "",
                icon: const Icon(Icons.mail_sharp),
                hintText: "Your mail address",
              ),
              validator: Validators.validateMailString,
              controller: _mailController,
              // Use 'maxLength' to restrict length of the input
              maxLength: 64,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: const Icon(Icons.vpn_key_sharp),
                  hintText: "Your password"),
              validator: Validators.validatePasswordString,
              controller: _passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: _proceed,
            ),
          ],
        ),
      ),
    );
  }

  void _proceed() {
    if (_key.currentState.validate()) {
      print("Validation succeeded");
      // TextEditingControllers can also be used to handle text selections
      // made by the user via the 'someController.selection.start' and
      // 'someController.selection.end' properties
      print("Mail: ${_mailController.text}");
      print("Password: ${_passwordController.text}");
    } else {
      print("Validation failed -- at least one FormField has errors");
    }
  }
}
