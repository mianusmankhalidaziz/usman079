import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
class HomePage extends StatefulWidget {
  final QuizBrain quizBrain;
  HomePage({required this.quizBrain});
  @override
  _HomePageState createState() => _HomePageState();
}
  class _HomePageState extends State<HomePage> {
  List<Icon> score_record = [];
  void checkAnswer(bool AnswerPicker) {
    bool? correctAnswer = widget.quizBrain.getCorrectAnswer();
    setState(() {
      if (widget.quizBrain.isFinished() == true) {
          Alert(
          context: context,
          title: 'Sorry',
          desc: 'Question are finished enjoy next shuffle level',
          ).show();
          widget.quizBrain.reset();
          score_record = [];
      }
      else {
        if (AnswerPicker == correctAnswer) {
          score_record.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          score_record.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        widget.quizBrain.nextQuestion();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  widget.quizBrain.get_question_statement(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green, // Text Color
                ),
                child: const Text(
                  'Right',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red, // Text Color
                ),
                child: const Text(
                  'Wrong',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  checkAnswer(false);
                },
              ),
            ),
          ),
          Row(
            children: score_record,
          )
        ],
      ),
    );
  }
}