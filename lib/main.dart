import 'package:flutter/material.dart';

void main() {
  runApp(const RenderObjectGapApp());
}

class RenderObjectGapApp extends StatelessWidget {
  const RenderObjectGapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("RenderObject Gap"),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 25),
              const StyledText("Column"),
              const SizedBox(height: 25),
              const StyledText("Column"),
              const SizedBox(height: 50),
              Row(
                children: const <Widget>[
                  SizedBox(width: 25),
                  StyledText("Row"),
                  SizedBox(width: 25),
                  StyledText("Row"),
                  SizedBox(width: 25),
                ],
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}

/// This widget is used to reduce the code above in the example.
/// It provides the text widget with some styling to reduce boilerplate.
class StyledText extends StatelessWidget {
  final String text;

  const StyledText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
