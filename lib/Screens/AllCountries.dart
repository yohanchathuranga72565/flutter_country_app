import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_app/Screens/Country.dart';

class AllCountries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('All Countries'),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Country("India");
                    }),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'India',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Country("Canada");
                    }),
                  );
                },
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: Text(
                      'Canada',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
