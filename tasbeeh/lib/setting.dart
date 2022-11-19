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
        backgroundColor: Colors.blue,
      ),

    );
  }
}
