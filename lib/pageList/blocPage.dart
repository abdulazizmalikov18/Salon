import 'package:flutter/material.dart';

class BlockPage extends StatefulWidget {
  BlockPage(key) : super(key: key);

  @override
  _BlockPageState createState() => _BlockPageState();
}

class _BlockPageState extends State<BlockPage> {
  int ball = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Beauty is everywhere!",
              style: TextStyle(fontSize: 34, color: Colors.white),
            ),
            Container(
                padding: EdgeInsets.all(12),
                width: 280,
                child: Text(
                  "Discover beauty professionals and book services near you",
                  style: TextStyle(fontSize: 18, color: Colors.white60),
                ))
          ],
        ),
      ),
    );
  }
}
