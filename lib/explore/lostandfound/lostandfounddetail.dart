import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:xmux/init.dart';

class LostAndFoundDetailPage extends StatelessWidget {
  final DataSnapshot dataSnapshot;

  LostAndFoundDetailPage(this.dataSnapshot);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Details"),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.all(20.0),
            child: new Column(
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                      new NetworkImage(dataSnapshot.value['senderPhotoUrl']),
                ),
                new Divider(
                  height: 20.0,
                  color: Theme.of(context).canvasColor,
                ),
                new Text(
                  dataSnapshot.value['senderName'],
                  style: Theme.of(context).textTheme.subhead,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new RaisedButton(
                      color: Theme.of(context).canvasColor,
                      onPressed: dataSnapshot.value['uid'] == firebaseUser.uid
                          ? () {
                              Navigator.pop(context);
                              FirebaseDatabase.instance
                                  .reference()
                                  .child('lostandfound')
                                  .child(dataSnapshot.key)
                                  .remove();
                            }
                          : null,
                      child: new Text(
                        "Delete",
                        style: Theme
                            .of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.red),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
