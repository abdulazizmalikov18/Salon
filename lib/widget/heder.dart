import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imtihon1/widget/search.dart';

import '../constants.dart';

class HederPage extends StatefulWidget {
  const HederPage({Key? key}) : super(key: key);

  @override
  _HederPageState createState() => _HederPageState();
}

class _HederPageState extends State<HederPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25.0),
          )),
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _labelName('Daria'),
                  _settingProfile(),
                ],
              ),
              SearchForm(size: size),
            ],
          ),
        ),
      ),
    );
  }

  _settingProfile() {
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(CupertinoIcons.add,color: Colors.white,),
              onPressed: () {}),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage("https://images.unsplash.com/photo-1628613779039-7a71e2df81d5?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                    fit: BoxFit.fill)),
          ),
        ],
      ),
    );
  }

  _labelName(String name) {
    return RichText(
      text: TextSpan(
        text: 'Hello ',
        style: TextStyle(fontSize: 30, color: Colors.white.withOpacity(0.8)),
        children: [
          TextSpan(
              text: "$name.",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(1))),
        ],
      ),
    );
  }
}

