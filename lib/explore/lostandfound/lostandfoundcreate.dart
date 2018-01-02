import 'package:flutter/material.dart';

class LostAndFoundCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LostAndFoundCreatePageState();
}

class LostAndFoundCreatePageState extends State<LostAndFoundCreatePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Create new L&F card"),),
      body:new ListView(children: <Widget>[],),
    );
  }
}
