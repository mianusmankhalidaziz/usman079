import 'package:flutter/material.dart';
import 'package:tasbeeh/setting.dart';



List<data> myData=<data>[];
int  _count=0;
class data {
   String Astagfirullah ="";

  data({
    this.Astagfirullah = "",
  });

  get count => null;

}


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
      ListView.builder(
        itemCount: myData.length,
        itemBuilder: (BuildContext context, int position) {
          data productos = myData.elementAt(position);
          return ListTile(
            title: Text('${productos.Astagfirullah}'),
            trailing: new Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

              ],
            ),
          );
        },
      );
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
    body: Container(
    child : new Column(
    children: <Widget>[
    new Center(
    child: new Text("Tasbeeh!",
    style: new TextStyle(fontSize: 30.0,
    color: Colors.greenAccent

    ),),
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
      Center(
        child: new Text("Astagfirullah",
          style: new TextStyle(fontSize: 30.0,
              color: Colors.green),),
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


      Center(
        child: ElevatedButton(
          onPressed: () {
            Text("Add Tasbeeh");
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(

                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Enter Name of Tasbeeh!"),
                              Padding(
                                padding: EdgeInsets.all(8.0),

                                child: TextFormField(

                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter the Name of Tasbeeh',
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    TextEditingController _count1=TextEditingController();
                                    Controller: _count1;
                                    var _count2=_count1;


                                    Navigator.pop(context);
                                  },
                                  child: Text("Submit"),

                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Text("Save"),
        ),
      ),




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

