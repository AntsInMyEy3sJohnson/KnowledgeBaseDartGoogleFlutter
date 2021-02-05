import 'package:chapter_12_examples/basic_routing/routes/kitten_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  static const String ROUTE_IDENTIFIER = "/";

  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Do you want to see a kitten?"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () => Navigator.pushNamed(context, KittenPage.ROUTE_IDENTIFIER),
                child: const Text("Who doesn't?"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
