import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {


  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting Tasbeeh"),
        backgroundColor: Colors.green,
      ),
      body:Container(
        child: new Column(
        children: [
         new Center(
           child: new Text("Setting",
             style: new TextStyle(fontSize: 30.0,
                 color: Colors.greenAccent),
           ),
              
         ),
          Center(

            child: ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text("Predefined"),
            ),
    ),



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
                                  Text("Enter Name of Tasbeeh & its Limit Respectively!"),
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
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter Limit of Tasbeeh',
                                      ),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      onPressed: () {
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
              child: Text("Custom"),
            ),
          ),
          
        ],
        ),
      )
    );


  }

}





