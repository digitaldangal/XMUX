import 'package:flutter/material.dart';
import 'package:xmux/enginepage.dart';

String wolframAppID = "";

class WolframResult extends StatelessWidget {
  final String inputString;

  WolframResult(this.inputString);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(engineTitle + " Result"),
          backgroundColor: enginePageColor,
        ),
        body: new ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(1.0),
          children: <Widget>[
            new Image(
                image: new NetworkImage(
                    "http://api.wolframalpha.com/v1/simple?appid=" +
                        wolframAppID +
                        "&i=" + Uri.encodeComponent(inputString) +
                        "&fontsize=18&width=400")),
          ],
        )
    );
  }
}
