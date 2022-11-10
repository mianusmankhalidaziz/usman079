import 'package:flutter/material.dart';

class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({@required this.colors, this.cardWigdet});
  final Color colors;
  final Widget cardWigdet;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardWigdet,
      decoration: BoxDecoration(
        color: colors,
        borderRadius:BorderRadius.circular(10.0),

      ),
    );
  }
}