import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Text> textList = [];
  int randomnumber = 0;

  void randomNumber() {
    setState(() {
      randomnumber = Random().nextInt(10) + 1;

    });

  }

  void GenerateNumber() {
    setState(() {

      textList.clear();
      for (int i = 1; i <= 10; i++) {
        textList.add(Text("${randomnumber} * ${i} = ${randomnumber * i}"));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.black26,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.reset_tv),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              textList.clear();
              randomnumber = 0;
              setState(() {});
            }),
        appBar: AppBar(
            title: const Text("Random Number Table Generator App"),
            centerTitle: true,
            backgroundColor: Colors.blueGrey[800]),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                '$randomnumber',
                // style: 'style',
              ),
              const SizedBox(
                height: 50,
              ),


              SizedBox(
                child: ElevatedButton(
                  onPressed: randomNumber,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),


                  child: const Text(
                    "Generate Random Number",
                    textAlign: TextAlign.center,
                  ),

                ),


              ),

              const SizedBox(
                height: 50,
              ),

              SizedBox(
                child: ElevatedButton(
                  onPressed: GenerateNumber,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: const Text(
                    "Generate Table",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: SizedBox(
                      child: (textList.isNotEmpty)
                          ? Column(
                              children: [
                                textList[0],
                                textList[1],
                                textList[2],
                                textList[3],
                                textList[4],
                                textList[5],
                                textList[6],
                                textList[7],
                                textList[8],
                                textList[9],
                              ],
                            )
                          : const SizedBox(width: 100, child: Text(" "))),
                ),
              ),
            ],
          )
        ]));
  }
}
