import 'package:farixo/models/chat_model.dart';
import 'package:flutter/material.dart';

import '../chat.dart';

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() {
    return new ChatScreenState();
  }
}

class ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: dummydata.length,
      itemBuilder: (context, i) => new Column(
            children: <Widget>[
              new Divider(
                height: 10.0,
              ),
              InkWell(
                splashColor: Colors.green,
                onTap: () {
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (context) => Chat()));
                },
                child: new ListTile(
                  leading: new CircleAvatar(
                    foregroundColor: Theme.of(context).primaryColor,
                    backgroundColor: Colors.grey,
                    backgroundImage: new NetworkImage(dummydata[i].avatarUrl),
                  ),
                  title: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        dummydata[i].name,
                        style: new TextStyle(fontWeight: FontWeight.bold),
                      ),
                      new Text(
                        dummydata[i].time,
                        style:
                            new TextStyle(color: Colors.grey, fontSize: 14.0),
                      ),
                    ],
                  ),
                  subtitle: new Container(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      dummydata[i].message,
                      style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                ),
              )
            ],
          ),
    );
  }
}
