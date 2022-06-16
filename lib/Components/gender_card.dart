import 'package:flutter/material.dart';

import '../constants.dart';

class genderCard extends StatelessWidget {
  genderCard({@required this.gender, @required this.genIcon});

  final String gender;
  final IconData genIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(gender, style: kTextStyle),
      ],
    );
  }
}
