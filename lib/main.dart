import 'package:flutter/material.dart';

main() {
  runApp(AppTrip());
}

class AppTrip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          title: Text('AppTrip'),
          actions: <Widget>[Icon(Icons.more_vert)],
        ),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Container(
                    height: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset('assets/images/belfast.jpg',
                            fit: BoxFit.cover)
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
