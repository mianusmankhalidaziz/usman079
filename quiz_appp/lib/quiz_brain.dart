import 'question.dart';
class QuizBrain {
  int _questionNumber = 0;
  final List<Question> _questionBank = [];
  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }
  void rand(){
    _questionBank.shuffle();
  }
  String get_question_statement() {

    return _questionBank[_questionNumber].question_statement;
  }
  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].statement_Answer;
  }
  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      return true;

    } else {
      return false;
    }
  }
  void insertQuestion(String a,bool b){
    _questionBank.add(Question(a,b));
  }
  void reset() {
    _questionNumber = 0;
  }
}



