import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/result_overlay.dart'; 

class QuizPage extends StatefulWidget{
  @override
  State createState() => new QuizPageState();

}

class QuizPageState extends State<QuizPage> {
  Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Imposto é roubo.", true),
    new Question("O SAM é brabo.", true),
    new Question("LOTR é melhor que Harry Potter.", true),
    new Question("Corno não é gente.", false),
    new Question("Gado D+++", true),
  ]);

  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState(){
    super.initState();

    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer){
    isCorrect = (currentQuestion.answer == answer);

    quiz.answer(isCorrect);

    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new AnswerButton(true, () => handleAnswer(true)), // True Button
            new QuestionText(questionText, questionNumber), // Question
            new AnswerButton(false, () => handleAnswer(false)) // False Button
          ],
        ),
        overlayShouldBeVisible == true ? new ResultOverlay(
          isCorrect,
          (){
            currentQuestion = quiz.nextQuestion;
            this.setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : new Container()
      ],
    );
  }
}