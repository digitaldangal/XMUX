import 'package:flutter/material.dart';

class IDPage extends StatefulWidget {
  IDPage({Key key}) : super(key: key);

  @override
  State createState() => new _IDPageState();
}

class _IDPageState extends State<IDPage> {

  final TextEditingController _usernameController = new TextEditingController();
  final TextEditingController _idPasswordController = new TextEditingController();
  final TextEditingController _epaymentPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Me"),),
      body: new Container(
        margin: const EdgeInsets.only(right: 5.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              controller: _usernameController,
              decoration: new InputDecoration(
                hintText: 'Campus ID',
                icon: new Icon(
                  Icons.account_circle,
                ),
              ),
            ),
            new TextField(
              controller: _idPasswordController,
              obscureText: true,
              decoration: new InputDecoration(
                hintText: 'Campus ID Password',
                icon: new Icon(
                  Icons.lock_outline,
                ),
              ),
            ),
            new TextField(
              controller: _epaymentPasswordController,
              obscureText: true,
              decoration: new InputDecoration(
                hintText: 'EPayment Password',
                icon: new Icon(
                  Icons.lock_outline,
                ),
              ),
            ),
            new FlatButton(
              child: new Container(
                height: 30.0,
                decoration: new BoxDecoration(
                  color: Theme
                      .of(context)
                      .accentColor,
                ),
                child: new Center(
                    child: new Text("Sign In",
                        style: new TextStyle(
                          color: Colors.white,
                        ))),
              ),
              onPressed: () {
                print('Sign In');
                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("Success!")));
              },
            ),
          ],
        ),
      ),
    );
  }
}