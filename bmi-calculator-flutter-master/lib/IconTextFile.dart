
import 'package:flutter/material.dart';
class RepeatTextAndIconWidget extends StatelessWidget {
  final IconData iconData;
  final String label;

  const RepeatTextAndIconWidget({@required this.iconData, this.label}) ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,

          size: 85.0,
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
          ),

        ),
      ],
    );
  }
}