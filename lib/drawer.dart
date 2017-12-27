import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xmux/config.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translate.dart';

class DrawerPage extends StatefulWidget {
  DrawerPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new DrawerPageState();
}

class DrawerPageState extends State<DrawerPage> {
  Future _loginEPayment(BuildContext context) async {
    showDialog<String>(
      context: context,
      child: new AlertDialog(
        title: const Text('Login EPayment'),
        content: new Text(
          "enter",
        ),
        actions: <Widget>[
          new FlatButton(child: const Text('DISAGREE'), onPressed: () {}),
          new FlatButton(
            child: const Text('AGREE'),
            onPressed: () {
              Navigator.pop(context, "hhh");
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 250.0,
      child: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(
              child: new FlatButton(
                onPressed: () {
                  Navigator.popAndPushNamed(context, "/me");
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.all(10.0),
                      child: new CircleAvatar(
                        backgroundImage:
                            new NetworkImage(globalPersonalInfoState.avatarURL),
                        radius: 30.0,
                      ),
                    ),
                    new Expanded(
                      child: new Text(
                        MainLocalizations.of(context).get("header/welcome") +
                            "\n" +
                            globalPersonalInfoState.fullName,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            new Expanded(
              child: new ListView(
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      if (globalPersonalInfoState.ePaymentPassword != null)
                        Navigator.popAndPushNamed(context, "/epayment");
                      else
                        _loginEPayment(context);
                    },
                    child: new Row(
                      children: <Widget>[
                        new Icon(Icons.credit_card),
                        new Text(MainLocalizations.of(context).get("e-payment"))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class EPaymentLoginManager {
//  final TextEditingController _ePaymentPasswordController =
//      new TextEditingController();
//  Future<bool> _loginEPayment() async {
//    var response = await http.post(BackendApiConfig.address + "/bill", body: {
//      "id": globalPersonalInfoState.campusId,
//      "pass": _ePaymentPasswordController.text,
//    });
//    if (response.statusCode >= 400) {
//      Scaffold
//          .of(context)
//          .showSnackBar(new SnackBar(content: new Text("Login Failed")));
//      setState(() {
//        _isProcessing = false;
//      });
//      return false;
//    }
//    Map resJson = JSON.decode(response.body);
//
//    globalPersonalInfoState.ePaymentPassword = _ePaymentPasswordController.text;
//    _ePaymentPasswordController.clear();
//    globalCalendarState.paymentData = resJson;
//
//    _saveData(JSON.encode({
//      "campusId": globalPersonalInfoState.campusId,
//      "password": globalPersonalInfoState.password,
//      "ePaymentPassword": globalPersonalInfoState.ePaymentPassword,
//    }));
//    return true;
//  }
//
//  Future<Null> _saveData(String loginInfo) async {
//    String dir = (await getApplicationDocumentsDirectory()).path;
//    await (new File('$dir/login.dat')).writeAsString(loginInfo);
//  }
//
//  void _handleSubmitted() {
//    if (_ePaymentPasswordController.text.isEmpty)
//      Scaffold.of(context).showSnackBar(
//          new SnackBar(content: new Text("Format Error. Please Check.")));
//    else {
//      setState(() {
//        _isProcessing = true;
//      });
//      _loginEPayment().then((r) {
//        if (r)
//          Scaffold
//              .of(context)
//              .showSnackBar(new SnackBar(content: new Text("Success !")));
//        setState(() {
//          _isProcessing = false;
//        });
//      });
//    }
//  }
//}
