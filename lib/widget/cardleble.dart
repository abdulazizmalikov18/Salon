import 'package:flutter/material.dart';
import 'package:imtihon1/pageList/morePage.dart';

import '../constants.dart';

class CardLabel extends StatelessWidget {
  final String? lightText;
  final String? boldText;
  final bool moreButton;

  const CardLabel({
    Key? key,
    this.lightText,
    this.boldText,
    this.moreButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: lightText,
            style: TextStyle(
                color: Colors.grey[600]!.withOpacity(0.7),
                fontSize: 20,
                fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                  text: boldText,
                  style: TextStyle(
                      color: Colors.grey[900]!.withOpacity(0.8),
                      fontWeight: FontWeight.w500))
            ],
          ),
        ),
        moreButton
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MorePage(title: 'All');
                      },
                    ),
                  );
                },
                child: Text(
                  'More',
                  style: TextStyle(
                    fontSize: 18,
                      color: kPrimaryColor, fontWeight: FontWeight.w500),
                ),
              )
            : SizedBox(
                height: 0,
              ),
      ],
    );
  }
}
