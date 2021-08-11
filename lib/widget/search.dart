import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
    @required this.size,
  }) : super(key: key);

  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size!.width * 0.9,
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      decoration: BoxDecoration(
          color: Colors.grey[100]!.withOpacity(0.2),
          borderRadius: BorderRadius.circular(14)),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Icon(CupertinoIcons.search,color: Colors.white,),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
            hintText: 'What are you looking for?'),
      ),
    );
  }
}
