import 'package:flutter/material.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../utils/question.dart';
import '../utils/quiz.dart';

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context){
    return new Stack(
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => print("You answered true")),
            new QuestionText("Ticolé é muito bom?", 1),
            new AnswerButton(false, () => print("You answered false"))
          ],
        ),
      ],
    );
  }
}