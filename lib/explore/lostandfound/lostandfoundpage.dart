import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xmux/explore/lostandfound/lostandfoundcreate.dart';
import 'package:xmux/explore/lostandfound/lostandfounddetail.dart';
import 'package:xmux/init.dart';
import 'package:xmux/translate.dart';

class LostAndFoundPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LostAndFoundPageState();
}

class LostAndFoundPageState extends State<LostAndFoundPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(MainLocalizations.of(context).get("lostandfound")),
      ),
      body: new FirebaseAnimatedList(
        query: FirebaseDatabase.instance.reference().child('lostandfound'),
        sort: (a, b) => b.key.compareTo(a.key),
        padding: new EdgeInsets.all(8.0),
        reverse: false,
        itemBuilder:
            (_, DataSnapshot snapshot, Animation<double> animation, int index) {
          return new LostAndFoundCard(
              dataSnapshot: snapshot, animation: animation);
        },
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
//          Navigator.of(context).push(
//            new MaterialPageRoute(builder: (BuildContext context) {
//              return new LostAndFoundCreatePage();
//            }),
//          );
          FirebaseDatabase.instance
              .reference()
              .child('lostandfound')
              .push()
              .set({
            'uid': firebaseUser.uid,
            'time': new DateTime.now().toIso8601String(),
            'senderName': firebaseUser.displayName,
            'senderPhotoUrl': firebaseUser.photoUrl,
            'location': 'A5#G1',
            'brief': 'credit card',
            'details': 'here are some details',
          });
        },
        child: new Icon(
          Icons.add,
          color: Colors.white,
        ),
        tooltip: "Create new",
      ),
    );
  }
}

class LostAndFoundCard extends StatelessWidget {
  final DataSnapshot dataSnapshot;
  final Animation<double> animation;

  LostAndFoundCard({@required this.dataSnapshot, @required this.animation});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(parent: animation, curve: Curves.easeOut),
      child: new FlatButton(
        onPressed: () {
          Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) {
              return new LostAndFoundDetailPage(dataSnapshot);
            }),
          );
        },
        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(
                    backgroundImage:
                        new NetworkImage(dataSnapshot.value['senderPhotoUrl'])),
              ),
              new Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      dataSnapshot.value['senderName'] +
                          " " +
                          DateTime.parse(dataSnapshot.value['time']).toString(),
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    new Text("Location : "+dataSnapshot.value['location']),
                    new Text(dataSnapshot.value['brief']),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
