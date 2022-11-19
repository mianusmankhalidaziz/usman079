import 'package:flutter/material.dart';
import 'home_page.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
QuizBrain quizBrain = QuizBrain();
void main() => runApp(const Quiz());
class Quiz extends StatelessWidget {
  const Quiz({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}
class _QuizPageState extends State<QuizPage> with QuizBrain {
  final fieldText = TextEditingController();
  String   question_statement="";
  bool  statement_Answer=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Quiz App",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)),backgroundColor: Colors.blue,),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
              children: [
                SizedBox(height: 100,),
                TextField(
                  controller:  fieldText,
                  decoration: InputDecoration(
                    hintText: "Enter Your Question Here",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                    suffixIcon: IconButton(
                        onPressed:(){
                          fieldText.clear();
                        },
                        icon: const Icon(Icons.clear_rounded)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      height:30, //height of button
                      width:200, //width of button
                      child: ElevatedButton(
                        onPressed: (){
                          statement_Answer=true;
                          question_statement=fieldText.text;
                          quizBrain.insertQuestion(question_statement,statement_Answer);
                          fieldText.clear();
                        },
                            style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),

                            backgroundColor: MaterialStateProperty.all(Colors.blue)),
                        child: const Text('Right',),
                      ),
                    ),
                    SizedBox(width: 20,),
                    SizedBox(
                      height:30, //height of button
                      width:200, //width of button
                      child: ElevatedButton(
                          onPressed: (){
                          statement_Answer=false;
                          question_statement=fieldText.text;
                          quizBrain.insertQuestion(question_statement,statement_Answer);
                          fieldText.clear();
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),
                            backgroundColor: MaterialStateProperty.all(Colors.grey )),
                        child: const Text('Wrong',),),
                    ),
                  ],
                ),
                SizedBox(height: 150,),
                SizedBox(
                  height:30, //height of button
                  width:200, //width of button
                  child: ElevatedButton(
                      onPressed: (){
                      if(question_statement.isEmpty){
                        Alert(
                          context: context,
                          title: 'Sorry',
                          desc: ' Question list are empty need some questions',
                        ).show();
                      }
                      else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  HomePage(quizBrain: quizBrain,)),
                        );
                        quizBrain.rand();
                      }
                      },
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(8),
                        backgroundColor: MaterialStateProperty.all(Colors.blue)),
                    child: const Text(' Start quiz',),),
                ),


              ]),
        )


    );
  }


}


