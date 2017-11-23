import 'package:flutter/material.dart';

Color enginePageColor = Colors.orange;
var engineTitle = new Text("Wolfram Engine");

class EnginePage extends StatefulWidget {
  EnginePage({Key key}) :super(key: key);

  @override
  EnginePageState createState() => new EnginePageState();
}

class EnginePageState extends State<EnginePage> {

  static TextEditingController _inputTextController = new TextEditingController();

  Scaffold wolframEngine = new Scaffold(
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
                  image: new NetworkImage(
                      "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1512064231&di=e86e5ecc86ec5ec3934af372ba4a58e7&imgtype=jpg&er=1&src=http%3A%2F%2Fi-3.yxdown.com%2F2015%2F10%2F20%2F40b6faa9-8c95-46c7-88a9-fea0723516a5.png")
              ),
            ),
            new Text("Search things by powerful wolfram engine."),
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
                    _inputTextController.text += "Ha";
                  },
                ),
              ],
            ),
          ],
        ),
      )

      ,

    )

    ,

  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: engineTitle,
        backgroundColor: enginePageColor,
      ),
      body: wolframEngine,
    );
  }
}