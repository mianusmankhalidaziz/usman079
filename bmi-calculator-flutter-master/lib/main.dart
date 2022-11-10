import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child:

                RepeatContainerCode(
                  colors : Color(0xFF1D1E33),
                ),),
              Expanded(child:RepeatContainerCode(
                colors : Color(0xFF1D1E33),
                  cardWigdet: Column(
                    mainAxisAlignment: .center,
                    children: [
                      Icon(
                        FontAwesomeIcons.male,
                        size: 80.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text('MALE',
                        style: TextStyle(
                        fontSize: 18.0,
                      ),

                      ),
                    ],
                  ),
              ),),
            ],
          ),),
          Expanded(child:RepeatContainerCode(colors : Color(0xFF1D1E33),),),
          Expanded(child:  Row(
            children: [
              Expanded(child: RepeatContainerCode(colors : Color(0xFF1D1E33),),),
              Expanded(child: RepeatContainerCode(colors : Color(0xFF1D1E33),),),
            ],
          ),),
        ],
      )
    );
  }
}

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
