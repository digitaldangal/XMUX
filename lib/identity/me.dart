import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:xmux/config.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translate.dart';

class MePage extends StatefulWidget {
  @override
  MePageState createState() => new MePageState();
}

class MePageState extends State<MePage> {
  final TextEditingController _ePaymentPasswordController =
      new TextEditingController();
  bool _isDeleteing = false;

  Future<Null> _deleteData() async {
    _isDeleteing=true;
    Navigator.pop(context);
    String dir = (await getApplicationDocumentsDirectory()).path;
    await (new File('$dir/login.dat')).delete();
    globalPersonalInfoState.clear();
    globalCalendarState.clear();
    runLoginPage();
  }

  @override
  Widget build(BuildContext context) {
    return _isDeleteing == true
        ? new Container()
        : new Scaffold(
            appBar: new AppBar(
              title: new Text(MainLocalizations.of(context).get("me")),
            ),
            body: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      new NetworkImage(globalPersonalInfoState.avatarURL),
                ),
                new Divider(
                  height: 15.0,
                  color: Theme.of(context).canvasColor,
                ),
                new Text(globalPersonalInfoState.fullName),
                new Divider(
                  height: 10.0,
                  color: Theme.of(context).canvasColor,
                ),
                new Divider(
                  height: 10.0,
                  color: Theme.of(context).canvasColor,
                ),
                new Container(
                  margin: const EdgeInsets.all(10.0),
                  child: new MaterialButton(
                    color: Theme.of(context).splashColor,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                            MainLocalizations.of(context).get("me/signout") +
                                " "),
                        new Icon(Icons.exit_to_app),
                      ],
                    ),
                    onPressed: _deleteData,
                  ),
                ),
              ],
            ),
          );
  }
}
