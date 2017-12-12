import 'dart:async';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:xmux/engine/inputconstructor.dart';
import 'package:xmux/homepage.dart';

EventBus loginEventBus = new EventBus();

//final ThemeData IOSTheme = new ThemeData(
//  primarySwatch: Colors.orange,
//  primaryColor: Colors.grey[100],
//  primaryColorBrightness: Brightness.light,
//);

final ThemeData defaultTheme = new ThemeData(
  primarySwatch: Colors.blue,
  accentColor: Colors.lightBlue,
);



void main() {
  mainFunc();
}

Future mainFunc() async {
//
//    runApp(new MaterialApp(home: new Scaffold(
//      backgroundColor: Colors.purple[900],
//      body: new Center(
//        child: new Text(
//          "X",
//          style: new TextStyle(
//            color: Colors.white,
//            fontSize: 100.0,
//          ),
//        ),
//      ),
//    )));
//
//    await Future.(const Duration(seconds: 2),() => "1");
//
    runApp(
    new MaterialApp(
      title: 'XMUX',
      home: new HomePage(),
      theme: defaultTheme,
      routes: <String, WidgetBuilder>{
        "/engine/constructor": (BuildContext context) => new InputConstructor(),
      },
    ),
  );
}
