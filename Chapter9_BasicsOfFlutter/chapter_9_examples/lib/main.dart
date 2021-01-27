import 'package:chapter_9_examples/my_stateful_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chapter 9 Examples",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chapter 9 Examples"),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text("Child 1")),
              Center(child: Text("Child 2")),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                    ),
                    Positioned(
                      // Those positions refer to the parent widget
                      top: 30,
                      left: 30,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.yellow),
                      ),
                    ),
                    Text("I go above all the other widgets on the stack."),
                  ],
                ),
              ),
              Center(
                child: MyStatefulWidget("Chapter on stateful widgets"),
              )
            ],
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.lightBlue,
                spreadRadius: 4,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue,
                Colors.white,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
