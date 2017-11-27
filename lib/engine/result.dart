import 'package:flutter/material.dart';

class WolframResult extends StatelessWidget {
  final String inputString;

  WolframResult(this.inputString, {Key key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Result"),),
      body: new Text(Uri.encodeComponent(inputString)),
    );
  }
}
