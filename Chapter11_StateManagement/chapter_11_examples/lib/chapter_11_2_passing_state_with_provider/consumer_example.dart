import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Provider<SomeClass>(
      create: (context) => SomeClass(),
      // 'Consumer<T>' can be used as a direct child to 'Provider<T>'
      child: Consumer<SomeClass>(
        builder: (_, value, __){
          return Text("${value.text}");
        },
      ),
    );
  }

}

class SomeClass extends StatelessWidget {

  final String text = "blubbi";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}