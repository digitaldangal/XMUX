import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  final rawData;

  ClassesPage(this.rawData);

  var classData;

  @override
  Widget build(BuildContext context) {

    classData=rawData;
    return
      new ListView.builder(
        itemCount: classData == null ? 0 : classData["classes"].length,
        itemBuilder: (_, int index) {
          return new Card(
              child: new Text(classData["classes"][index]["class"] + "\n" +
                  classData["weekdays"][classData["classes"][index]["day"]] +
                  (classData["periods"][classData["classes"][index]["time"][0]] as String)
                      .substring(0, 7) +
                  (classData["periods"][classData["classes"][index]["time"][(classData["classes"][index]["time"] as List)
                      .length - 1]] as String).substring(7)
              )
          );
        }
    );
  }
}