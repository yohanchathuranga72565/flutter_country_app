import 'package:flutter/material.dart';
import 'package:country_app/Screens/Country.dart';
import 'package:dio/dio.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  late Future<List> countries;

  Future<List> getCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    countries = getCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(countries);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text('All Countries'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List>(
            future: countries,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                print(snapshot.data);
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return Country(snapshot.data![index]);
                            }),
                          );
                        },
                        child: Card(
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 8),
                            child: Text(
                              snapshot.data![index]['name'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Text('Not any data');
            }),
        // child: ListView(
        //   children: <Widget>[
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) {
        //             return Country("India");
        //           }),
        //         );
        //       },
        //       child: Card(
        //         elevation: 10,
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             'India',
        //             style: TextStyle(fontSize: 18),
        //           ),
        //         ),
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) {
        //             return Country("Canada");
        //           }),
        //         );
        //       },
        //       child: Card(
        //         elevation: 10,
        //         child: Padding(
        //           padding:
        //               const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        //           child: Text(
        //             'Canada',
        //             style: TextStyle(fontSize: 18),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
