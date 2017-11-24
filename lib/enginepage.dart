import 'package:flutter/material.dart';

Color enginePageColor = Colors.orange;
var engineTitle = new Text("Wolfram Engine");

class EnginePage extends StatefulWidget {
  EnginePage({Key key}) :super(key: key);

  @override
  _EnginePageState createState() => new _EnginePageState();
}

class _EnginePageState extends State<EnginePage> {

  static TextEditingController _inputTextController = new TextEditingController();

  Widget buildWolframPage() {
    return new Scaffold(
      body: new Container(
        margin: const EdgeInsets.all(10.0),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Flexible(
                child: new Image(
                    width: 150.0,
                    height: 150.0,
                    image: new AssetImage('res/wolfram.png'),
                ),
              ),
              new Text("Search anything by powerful wolfram engine."),
              new Row(
                children: <Widget>[
                  new Flexible(
                      child: new TextField(
                        autofocus: true,
                        controller: _inputTextController,
                        onSubmitted: null,
                        decoration: new InputDecoration.collapsed(
                            hintText: 'Push SEND button to use constructor'
                        ),
                        onChanged: (string) {},
                      )
                  ),
                  new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: () {
                      if (_inputTextController.text == "")
                        Navigator.of(context).pushNamed("/engine/constructor");
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: engineTitle,
        backgroundColor: enginePageColor,

      ),
      body: buildWolframPage(),
    );
  }
}