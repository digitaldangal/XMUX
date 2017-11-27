import 'package:flutter/material.dart';
import 'package:xmux/enginepage.dart';
import 'package:xmux/engine/result.dart';

class InputConstructor extends StatefulWidget {
  InputConstructor({Key key}) :super(key: key);

  @override
  _InputConstructorState createState() => new _InputConstructorState();
}

class _InputConstructorState extends State<InputConstructor> {

  final TextEditingController _inputTextController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: enginePageColor,
        title: new Text("Input Constructor"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                    child: new TextField(
                      autofocus: true,
                      controller: _inputTextController,
                      onSubmitted: null,
                      decoration: new InputDecoration(
                          hintText: 'Input here ! '
                      ),
                      onChanged: (string) {},
                    )
                ),
                new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () {
                    Navigator.of(context).push(
                        new MaterialPageRoute<Null>(
                          builder: (BuildContext context) {
                            return new WolframResult(_inputTextController.text);
                          },
                        ));
                  },
                ),
              ],
            ),
          ),
          new Row(children: <Widget>[
            new IconButton(
                icon: new Text("+", style: new TextStyle(fontSize: 30.0),),
                onPressed: () {
                  _inputTextController.text += "+";
                }),
            new IconButton(
                icon: new Text("-", style: new TextStyle(fontSize: 30.0),),
                onPressed: () {
                  _inputTextController.text += "-";
                }),
            new IconButton(icon: new Icon(Icons.close), onPressed: () {
              _inputTextController.text += "*";
            }),
            new IconButton(
                icon: new Text("/", style: new TextStyle(fontSize: 20.0),),
                onPressed: () {
                  _inputTextController.text += "/";
                }),
            new IconButton(
                icon: new Text("[", style: new TextStyle(fontSize: 20.0),),
                onPressed: () {
                  _inputTextController.text += "[";
                }),
            new IconButton(
                icon: new Text("]", style: new TextStyle(fontSize: 20.0),),
                onPressed: () {
                  _inputTextController.text += "]";
                }),
          ],),
        ],
      ),
    );
  }
}