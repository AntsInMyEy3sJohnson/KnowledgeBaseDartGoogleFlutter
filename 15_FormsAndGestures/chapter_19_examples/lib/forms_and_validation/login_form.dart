import 'package:chapter_19_examples/forms_and_validation/validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  // We need a global key to uniquely identify the form under validation
  // in the widget tree
  final _key = GlobalKey<FormState>();

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
                icon: const Icon(Icons.mail_sharp),
                hintText: "Your mail address"
              ),
              validator: Validators.validateMailString,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.vpn_key_sharp),
                hintText: "Your password"
              ),
              validator: Validators.validatePasswordString,
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

    if(_key.currentState.validate()) {
      print("Validation succeeded");
    } else {
      print("Validation failed -- at least one FormField has errors");
    }

  }

}
