import 'package:flutter/material.dart';
import 'level2.dart';
import 'main.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class level1 extends StatelessWidget {
  const level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matching Game",
      home: level1page(),
    );
  }
}
class level1page extends StatefulWidget {
  const level1page({Key? key}) : super(key: key);

  @override
  State<level1page> createState() => _level1pageState();
}

class _level1pageState extends State<level1page> {

  List<ItemModel>? hand;
  List<ItemModel>? number;

  void sound(String sond) {
    final player = AssetsAudioPlayer();
    player.open(
      Audio(sond),
    );
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    hand = [
      ItemModel(num: 1, image: "assets/one.png", accepting: false),
      ItemModel(num: 2, image: "assets/two.png", accepting: false),
      ItemModel(num: 3, image: "assets/three.png", accepting: false),
      ItemModel(num: 4, image: "assets/four.png", accepting: false),
      ItemModel(num: 5, image: "assets/five.png", accepting: false),
    ];
    number = List<ItemModel>.from(hand!);
    hand?.shuffle();
    number?.shuffle();
  }

  var first;
  var second;

  @override
  Widget build(BuildContext context) {
    if (number?.length == 0) {
      return level1page();
    }
    return Container(
      // decoration:const BoxDecoration(
      //   image:DecorationImage(
      //     image: AssetImage('assets/bg10.jpg'),
      //     fit: BoxFit.cover,),
      // ),
      child: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text('Matching Game'),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left:250)),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: hand!.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40,right:30),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              first = item;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              gradient: LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,
                                  colors: [
                                    Colors.green,
                                    Colors.brown,
                                    Colors.pink,
                                    Colors.lightBlueAccent,
                                  ]),
                              borderRadius: BorderRadius.circular(80),

                            ),

                            child: Image.asset(
                              item.image ?? "",
                              height: 90,
                              width: 90,
                            ),
                          ),
                        ),
                      );
                    }).toList()),
                Spacer(),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: number!.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 40,right:30),
                        child: GestureDetector(
                          onTap: () {
                            if (first.num == item.num) {
                              sound("assets/correct.wav");
                              setState(() {
                                number?.remove(item);
                                hand?.remove(first);
                              });
                            } else {
                              sound("assets/wrong.wav");
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 50,
                            decoration: BoxDecoration(
                              // color: Colors.pink,
                              gradient: LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,
                                  colors: [
                                    Colors.green,
                                    Colors.pink,
                                    Colors.lightBlueAccent,
                                  ]),
                              borderRadius: BorderRadius.circular(80),

                            ),

                            child: Text(
                              item.num.toString(),
                              style: TextStyle(fontSize: 30,color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    }).toList()),
                Padding(padding: EdgeInsets.only(right: 280))

              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('Home'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );

                  },
                ),
                Padding(padding: EdgeInsets.all(10)),
                // ElevatedButton(
                //   child: const Text('Level 2'),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.purple,
                //     elevation: 10,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //   ),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
              ],
            ),
          ],
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

