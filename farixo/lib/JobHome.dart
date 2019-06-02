import 'package:flutter/material.dart';

class Job extends StatefulWidget {
  BuildContext con;

  Job({@required this.con});

  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Container(
            height: 8.0,
          ),
          Text(
            'Job suggestion based on your choice.',
            style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.0),
          ),
          Container(
            height: 16.0,
          ),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              _jobCard("Android", "Noida", Icons.work, "AEO Logic"),
              _jobCard("Flutter", "Delhi", Icons.camera, "XYZ"),
              _jobCard("Android", "Noida", Icons.account_balance, "ABC"),
              _jobCard("Android", "Gurgaon", Icons.work, "FGH Ltd. Co")
              ,_jobCard("Flutter", "Ghaziabad", Icons.work, "AEO Logic")
            ],
            scrollDirection: Axis.vertical,
          ),
        ],
      ),
    );
  }

  Widget _jobCard(
      String jobTitle, String location, IconData icon, String company) {
    return Card(
      margin: EdgeInsets.only(left: 16.0, right: 16.0,top: 16.0),
      child: Container(padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.black54,
                  size: 64.0,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    jobTitle,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                  Text(company),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Quicksand',
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
