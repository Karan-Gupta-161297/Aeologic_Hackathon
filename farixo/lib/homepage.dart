import 'package:farixo/jobsuggestion.dart';
import 'package:farixo/pages/chat_screen.dart';
import 'package:farixo/pages/notifications.dart';
import 'package:farixo/pages/profile.dart';
import 'package:flutter/material.dart';
import 'JobHome.dart';
import 'jobsuggestion.dart';

var jobSelected = true;

class ChatUI extends StatefulWidget {
  @override
  _ChatUIState createState() => _ChatUIState();
}

class _ChatUIState extends State<ChatUI> with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new DefaultTabController(initialIndex: 1,
        length: 4,
        child: new Scaffold(
          appBar: new PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: new Container(
              color: Colors.black,
              child: new SafeArea(
                child: Column(
                  children: <Widget>[
                    new Expanded(child: new Container()),
                    new TabBar(
                      tabs: <Widget>[
                        new Tab(icon: new Icon(Icons.work)),
                        new Tab(icon: new Icon(Icons.message)),
                        new Tab(icon: new Icon(Icons.notifications)),
                        new Tab(icon: new Icon(Icons.person_pin))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: new TabBarView(
            children: [
              _jub(),
              new ChatScreen(),
              new Notifications(),
              new Profile(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _jub() {
    if (!jobSelected) {
      return JobSuggestion(
        con: context,
      );
    } else {
      return Job(
        con: context,
      );
    }
  }
}
