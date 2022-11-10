import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/IconTextFile.dart';
import 'package:bmi_calculator/ContainerFile.dart';
const activeColor=Color(0xFF1d1E33);
const deActiveColor=Color(0x111328);
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
  Color maleColor=deActiveColor;
  Color feMaleColor=deActiveColor;
  void updatecolor(int gender){
  if(gender==1){
    maleColor=activeColor;
    feMaleColor=deActiveColor;
  }
  if(gender==2){
    feMaleColor=activeColor;
    maleColor=deActiveColor;
  }
  }
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
                  colors : maleColor,
                  cardWigdet: RepeatTextAndIconWidget(
                    iconData: FontAwesomeIcons.person,
                    label: 'MALE',
                  ),
                ),),
              Expanded(child:RepeatContainerCode(
                colors : feMaleColor,
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




