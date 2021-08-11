import 'package:flutter/material.dart';
import 'package:imtihon1/widget/body.dart';

class HomePage extends StatefulWidget {
  HomePage(key) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurpleAccent,
        onPressed: () {},
        child: Icon(
          Icons.location_on,
          color: Colors.white,
        ),
      ),
      // appBar: AppBar(
      //   title: Text("HomePage"),
      //   automaticallyImplyLeading: false,
      // ),
      body: BodyPage(),
      
    );
  }
}
