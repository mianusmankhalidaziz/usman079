import 'package:flutter/material.dart';




class addnew extends StatefulWidget {
  const addnew({Key? key}) : super(key: key);

  @override
  State<addnew> createState() => _addnewState();
}

class _addnewState extends State<addnew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Tasbeeh"),
        backgroundColor: Colors.green,
      ),


    );
  }
}
