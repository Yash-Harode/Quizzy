import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final _questions = const [
    {
      'questionText': 'Q1. Who created Flutter?',
      'answers': [
        {'text': 'Facebook', 'score': -2},
        {'text': 'Adobe', 'score': -2},
        {'text': 'Google', 'score': 10},
        {'text': 'Microsoft', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. How many types of Widgets are there in Flutter?',
      'answers': [
        {'text': '3', 'score': -2},
        {'text': '4', 'score': -2},
        {'text': '1', 'score': -2},
        {'text': '2', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Which programming language is used by Flutter',
      'answers': [
        {'text': 'Ruby', 'score': -2},
        {'text': 'Dart', 'score': 10},
        {'text': 'C++', 'score': -2},
        {'text': 'Java', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q4. What is the name of Key Configuration file used in Flutter?',
      'answers': [
        {'text': 'pubspec.yaml', 'score': 10},
        {'text': 'pubspec.xml', 'score': -2},
        {'text': 'root.xml', 'score': -2},
        {'text': 'config.html', 'score': -2},
      ],
    },
    {
      'questionText':
          'Q5. Which type of widget allows you to modify its appearance dynamiccally as per user input?',
      'answers': [
        {
          'text': 'Stateless Widget',
          'score': -2,
        },
        {'text': 'Stateful Widget', 'score': 10},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Quizzy',
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 255, 255, 255),
                letterSpacing: 5),
          ),
          backgroundColor: const Color(0xFF00E676),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    if (_questionIndex < _questions.length) {
      _nextQuestion();
    }
    // ignore: avoid_print
    print(_questionIndex);
  }

  void _nextQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      // ignore: avoid_print
      print('We have more questions!');
    } else {
      // ignore: avoid_print
      print('No more questions!');
    }
  }
}
