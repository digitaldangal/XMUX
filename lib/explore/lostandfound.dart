import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/translate.dart';

class LostAndFoundPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LostAndFoundPageState();
}

class LostAndFoundPageState extends State<LostAndFoundPage> {
  Future _onRefresh() async {}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MainLocalizations.of(context).get("lostandfound")),
      ),
      body: new RefreshIndicator(onRefresh: _onRefresh, child: new ListView()),
      floatingActionButton: new FloatingActionButton(
        onPressed: (){},
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: "Create new",
      ),
    );
  }
}

class LostAndFoundCard {}
