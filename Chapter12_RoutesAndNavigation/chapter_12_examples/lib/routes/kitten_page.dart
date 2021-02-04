
import 'package:flutter/material.dart';

class KittenPage extends StatelessWidget {

  static const String ROUTE_IDENTIFIER = "/kitten";

  const KittenPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kitten Page"),
      ),
      body: Center(
        child: Image.network("https://cdn.pixabay.com/photo/2019/11/08/11/56/cat-4611189_960_720.jpg"),
      ),
    );
  }



}