import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(24.0),
        child: ListView(
          children: <Widget>[
            _jobCard("Job prefrence saved",
                "Now jobs will be suggeted according to your choice."),
            _jobCard(
                "Account Created", "Thank you for downloading our application."),
            _jobCard("Confirm your account", "Confirm your email address.")
          ],
        ),
      );
    }

    Widget _jobCard(String head, String summary) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                head,
                style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                summary,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Quicksand',
                ),
              )
            ],
          ),
        ),
      );
    }
}
