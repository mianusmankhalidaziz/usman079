import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'level1.dart';
import 'level2.dart';
import 'splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matching Game",
      home: splash(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    return Container(
      // decoration:const BoxDecoration(
      //   image:DecorationImage(
      //     image: AssetImage('assets/bg11.jpg'),
      //     fit: BoxFit.cover,),
      // ),
      child: Scaffold(
        backgroundColor:Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text('Matching Game'),
        ),
        body: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Let's Start",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 40,color: Colors.purple),),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                    child: const Text('Level 1'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => level1page()),
                      );

                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  ElevatedButton(
                    child: const Text('Level 2'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => level2Page()),
                      );

                    },
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}





class ItemModel {
  final int? num;
  final String? image;
  bool accepting;

  ItemModel({this.image, this.num, this.accepting = false});
}
