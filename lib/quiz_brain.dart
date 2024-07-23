import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'question.dart';

class QuizBrain {
  int questionNumber = 0;

  final List<Question> questionBank = [
    Question(q: 'question_1', a: true),
    Question(q: 'question_2', a: false),
    Question(q: 'question_3', a: true),
    Question(q: 'question_4', a: true),
    Question(q: 'question_5', a: true),
    Question(q: 'question_6', a: true),
    Question(q: 'question_7', a: false),
    Question(q: 'question_8', a: true),
    Question(q: 'question_9', a: false),
    Question(q: 'question_10', a: true),
    Question(q: 'question_11', a: true),
  ];

  void nextQuestion() {
    questionNumber++;
  }

  String getQuestionText(BuildContext context) {
    if (questionNumber < questionBank.length) {
      return getTextQuestion(
          questionBank[questionNumber].questionText, context);
    } else {
      return "";
    }
  }

  String getTextQuestion(String key, BuildContext context) {
    switch (key) {
      case 'question_1':
        return S.of(context).question_1.toString();
      case 'question_2':
        return S.of(context).question_2.toString();
      case 'question_3':
        return S.of(context).question_3.toString();
      case 'question_4':
        return S.of(context).question_4.toString();
      case 'question_5':
        return S.of(context).question_5.toString();
      case 'question_6':
        return S.of(context).question_6.toString();
      case 'question_7':
        return S.of(context).question_7.toString();
      case 'question_8':
        return S.of(context).question_8.toString();
      case 'question_9':
        return S.of(context).question_9.toString();
      case 'question_10':
        return S.of(context).question_10.toString();
      case 'question_11':
        return S.of(context).question_11.toString();
      case 'finished_title':
        return S.of(context).finished_title.toString();
      case 'finished_desc':
        return S.of(context).finished_desc.toString();
      case 'trueText':
        return S.of(context).trueText.toString();
      case 'falseText':
        return S.of(context).falseText.toString();

      default:
        return key;
    }
  }

  bool getCorrectAnswer() {
    return questionBank[questionNumber].questionAnswer;
  }

  bool isFinished() {
    return questionNumber >= questionBank.length - 1;
  }

  void reset() {
    questionNumber = 0;
  }
}
