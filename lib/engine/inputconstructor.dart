import 'package:flutter/material.dart';
import 'package:xmux/enginepage.dart';

class InputConstructor extends StatefulWidget {
  InputConstructor({Key key}) :super(key: key);

  @override
  _InputConstructorState createState() => new _InputConstructorState();
}

class _InputConstructorState extends State<InputConstructor> {

  final TextEditingController _inputTextController = new TextEditingController();

  @override
  Widget build(BuildContext) {
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

                  },
                ),
              ],
            ),
          ),
          new Row(children: <Widget>[
            new IconButton(icon: new Icon(Icons.add), onPressed: () {_inputTextController.text += "+";}),
            new IconButton(icon: new Icon(Icons.close), onPressed: () {_inputTextController.text += "*";})
          ],),

          new Text("\n\n\n\n\n\n\n\n\naaa")
        ],
      ),
    );
  }
}