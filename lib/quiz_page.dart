import 'package:flutter/material.dart';
import 'package:quizzler_app/generated/l10n.dart';
import 'package:quizzler_app/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      if (quizBrain.isFinished()) {
        Alert(
          context: context,
          title: S.of(context).finished_title,
          desc: S.of(context).finished_desc,
        ).show();

        quizBrain.reset();
        scoreKeeper.clear();
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(context),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                S.of(context).trueText,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: TextButton(
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                S.of(context).falseText,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
