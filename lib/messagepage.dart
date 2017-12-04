import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) :super(key: key);

  @override
  _MessagePageState createState() => new _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final TextEditingController _textController = new TextEditingController();
  final List<Message> _messages = <Message>[];

  Future<String> _getReply(String text) async {
    var response = await http.post(
        "https://xmux.azurewebsites.net/chat", body: {"msg": text});
    var resJson = JSON.decode(response.body);
    Message message = new Message(
      text: resJson["reply"],
      name: "Bdbai",
    );
    setState(() {
      _messages.insert(0, message);
    });
    return response.body;
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      _textController.clear();
      Message message = new Message(
        text: text,
        name: "Me",
      );
      setState(() {
        _messages.insert(0, message);
      });
      _getReply(text);
    }
  }


  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme
            .of(context)
            .accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
                children: <Widget>[
                  new Flexible(
                      child: new TextField(
                        autofocus: false,
                        controller: _textController,
                        onSubmitted: _handleSubmitted,
                        decoration: new InputDecoration.collapsed(
                            hintText: "Send Messages"),
                      )
                  ),
                  new Container(
                    margin: new EdgeInsets.symmetric(horizontal: 4.0),
                    child: new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: () => _handleSubmitted(_textController.text)
                    ),
                  )
                ]
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Messages"),
        ),
        body: new Column(
            children: <Widget>[
              new Flexible(
                  child: new ListView.builder(
                    padding: new EdgeInsets.all(8.0),
                    reverse: true,
                    itemBuilder: (_, int index) => _messages[index],
                    itemCount: _messages.length,
                  )
              ),
              new Divider(height: 1.0),
              new Container(
                decoration: new BoxDecoration(
                  color: Theme
                      .of(context)
                      .cardColor,
                ),
                child: _buildTextComposer(),
              )
            ]
        )
    );
  }
}

class Message extends StatelessWidget {
  Message({this.name, this.text});

  final String text;
  final String name;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(name[0])),
              ),
              new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(name, style: Theme
                        .of(context)
                        .textTheme
                        .subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(text),
                    )
                  ]
              )
            ]
        )
    );
  }
}