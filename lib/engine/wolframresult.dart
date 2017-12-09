import 'package:flutter/material.dart';
import 'package:xmux/config.dart';
import 'package:xmux/engine/enginepage.dart';

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
                        WolframConfig.appID +
                        "&i=" + Uri.encodeComponent(inputString) +
                        "&fontsize=18&width=400")),
          ],
        )
    );
  }
}
