import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/IconTextFile.dart';
import 'package:bmi_calculator/ContainerFile.dart';

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
                  cardWigdet: RepeatTextAndIconWidget(
                    iconData: FontAwesomeIcons.person,
                    label: 'MALE',
                  ),
                ),),
              Expanded(child:RepeatContainerCode(
                colors : Color(0xFF1D1E33),
                  cardWigdet: RepeatTextAndIconWidget(
                    iconData: FontAwesomeIcons.personDress,
                    label: 'FEMALE',
                  ),
              ),),
            ],
          ),),
          Expanded(child:RepeatContainerCode(colors : Color(0xFF1D1E33),

          ),),
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




