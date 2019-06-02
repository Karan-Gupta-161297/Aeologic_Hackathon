import 'package:flutter/material.dart';

import 'JobHome.dart';
import 'homepage.dart';

class JobSuggestion extends StatefulWidget {
  BuildContext con;
  JobSuggestion({@required this.con});
  @override
  _JobSuggestionState createState() => _JobSuggestionState();
}

class _JobSuggestionState extends State<JobSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _bubble('Android', Colors.blue),
              _bubble('Java Developer', Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _bubble('Flutter Developer', Colors.orange),
              _bubble('Pyhton', Colors.blue),
              _bubble('Dart', Colors.amber),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _bubble('Android', Colors.purple),
              _bubble('Java Developer', Colors.pink),
            ],
          ),
          Container(
            child: Text(
              '$selected',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Container(
            height: 64.0,
          ),
          MaterialButton(
            height: 48.0,
            onPressed: () {
              setState(() {
                jobSelected=true;
              });
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new Job()));
            },
            color: Colors.white,
            elevation: 8.0,
            splashColor: Colors.purple,
            child: Text(
              'Continue',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }

  var selected = [];

  Widget _bubble(String text, Color color) {
    var h = 60.0;
    return Card(
      color: Colors.black,
      elevation: 8.0,
      child: InkWell(
        onTap: () {
          if (selected.contains(text) == true) {
            selected.remove(text);
            setState(() {
              h = 60.0;
            });
          } else {
            selected.add(text);
            setState(() {
              h = 64.0;
            });
          }
          print(h);
          print(selected);
        },
        child: Container(
          margin: EdgeInsets.only(left: 4.0, top: 8.0),
          height: h,
          padding: EdgeInsets.all(16.0),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(24.0),
          ),
        ),
      ),
    );
  }
}
