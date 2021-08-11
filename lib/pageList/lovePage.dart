import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LovePage extends StatefulWidget {
  LovePage(key) : super(key: key);

  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const Center(child: Icon(Icons.cloud, size: 64.0, color: Colors.deepPurpleAccent)),
      const Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.deepPurpleAccent)),
      const Center(child: Icon(Icons.history_edu, size: 64.0, color: Colors.deepPurpleAccent)),
    ];
    final _kTabs = <Tab>[
      const Tab(icon: Icon(Icons.cloud), text: 'Tab1'),
      const Tab(icon: Icon(Icons.alarm), text: 'Tab2'),
      const Tab(icon: Icon(Icons.history_edu), text: 'Tab3'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text('History Love'),
          backgroundColor: Colors.deepPurpleAccent,
          // If TabController controller is not provided, then a
          // DefaultTabController ancestor must be provided instead.
          // Another way is to use a self-defined controller, c.f. "Bottom tab
          // bar" example.
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}