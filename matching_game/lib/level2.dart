import 'package:flutter/material.dart';
//import 'main.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class level2 extends StatelessWidget {
  const level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matching Game",
      home: level2Page(),
    );
  }
}
class level2Page extends StatefulWidget {
  const level2Page({Key? key}) : super(key: key);

  @override
  State<level2Page> createState() => _level2PageState();
}

class _level2PageState extends State<level2Page> {

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
      ItemModel(num: 6, image: "assets/six.png", accepting: false),
      ItemModel(num: 7, image: "assets/seven.png", accepting: false),
      ItemModel(num: 8, image: "assets/eight.png", accepting: false),
      ItemModel(num: 9, image: "assets/nine.png", accepting: false),
      ItemModel(num: 10, image: "assets/ten.png", accepting: false),
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
      return level2Page();
    }
    return Container(
      // decoration:const BoxDecoration(
      //   image:DecorationImage(
      //     image: AssetImage('assets/bg12.jpg'),
      //     fit: BoxFit.cover,),
      // ),
      child: Scaffold(
        backgroundColor:Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: Text('Matching Game'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(left:250)),
                Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: hand!.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30,right:30,top:10),
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
                                    Colors.black,
                                    Colors.black54,
                                    Colors.black54,
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
                              color: Colors.lightBlueAccent,
                              gradient: LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.black54,
                                    Colors.black54,
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Home'),
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                // Center(
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.red,
                //       elevation: 10,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //     ),
                //     onPressed: () {
                //       Navigator.pop(context);
                //     },
                //     child: const Text('Level 1'),
                //   ),
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