import 'package:flutter/material.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translate.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: 250.0,
      child: new Drawer(
        child: new Column(
          children: <Widget>[
            new DrawerHeader(
              child: new FlatButton(
                onPressed: (){
                  Navigator.popAndPushNamed(context, "/me");
                },
                child: new Row(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.all(10.0),
                      child: new CircleAvatar(
                        backgroundImage: new NetworkImage(globalPersonalInfoState.avatarURL),
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