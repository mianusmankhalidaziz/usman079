import 'package:flutter/material.dart';
import 'package:tasbeeh/setting.dart';


class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new makeItRainState();
  }
}



class makeItRainState extends State<home> {
  int _tasbeehCount = 0;

  void counter() {
    setState(() {
      _tasbeehCount = _tasbeehCount + 1;
    });
  }
  void refresh(){
    setState(() {
      _tasbeehCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: new AppBar(
        title: new Text('Tasbeeh Counter'),
          backgroundColor: Colors.green,
    ),
    body: new Container(
    child : new Column(
    children: <Widget>[
    new Center(
    child: new Text("Tasbeeh!",
    style: new TextStyle(fontSize: 30.0,
    color: Colors.greenAccent),),
    ),

     Center(
    child: ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
          return SettingScreen();

        }),);
      },
      child: Text("Setting"),
    ),

    ),

    new Expanded(
    child: new Center(
    child: new Text('$_tasbeehCount',
    style: new TextStyle(
    color: _tasbeehCount < 50 ? Colors.greenAccent: Colors.red,
    fontSize: 40.3,
    fontWeight: FontWeight.w500
    ),),
    )),

    new Expanded(
    child: new Center(
    child: new FloatingActionButton(
    onPressed: counter,
    child: new Text("Count!",
    style: new TextStyle(
    fontSize: 15.3,

    color: Colors.black

    ),)),
    )),

      new Expanded(
          child: new Center(
            child: new FloatingActionButton (
                onPressed: refresh,
                child: new Text("Reset",

                  style: new TextStyle(
                      fontSize: 15.3,
                      color: Colors.black
                  ),)),
          ))
    ],
    )

    ),
    );
  }
}

