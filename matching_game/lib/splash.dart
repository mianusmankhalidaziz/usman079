import 'package:flutter/material.dart';

import 'main.dart';


class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override

  void initState(){
    super.initState();
    _navigatehome();
  }

  _navigatehome()async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        image:DecorationImage(
          image: AssetImage('assets/bg9.jpg'),
          fit: BoxFit.cover,),
      ),
      child: Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Container(
            child: Text('Matching Game',
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',color: Colors.black ),
            ),

          ),
        ),
      ),
    );
  }
}
