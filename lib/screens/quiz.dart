import 'package:flutter/material.dart';
import 'dart:async'; // Import Timer class

import '../widgets/answer.dart';
import '../widgets/question.dart';

class Quiz extends StatefulWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  const Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Timer _timer; // Timer variable
  int _timerSeconds = 10; // Initial timer value

  @override
  void initState() {
    super.initState();
    _startTimer(); // Start the timer when the widget initializes
  }

  @override
  void didUpdateWidget(Quiz oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.questionIndex != oldWidget.questionIndex) {
      _restartTimer(); // Restart the timer when the question index changes
    }
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timerSeconds--; // Decrement the timer value every second
      });
      if (_timerSeconds == 0) {
        _timer.cancel(); // Cancel the timer when it reaches 0
        _nextQuestion(); // Move to the next question
      }
    });
  }

  void _restartTimer() {
    setState(() {
      _timerSeconds = 10; // Reset the timer to 10 seconds
    });
    _timer.cancel(); // Cancel the previous timer
    _startTimer(); // Start a new timer
  }

  void _nextQuestion() {
    widget.answerQuestion(0); // Answer with score 0 (timeout)
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: widget.questionIndex.toDouble() / widget.questions.length,
          minHeight: 15,
          backgroundColor: Colors.yellowAccent,
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                _timerSeconds.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
        Question(
          widget.questions[widget.questionIndex]['questionText'].toString(),
        ),
        ...(widget.questions[widget.questionIndex]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => widget.answerQuestion(answer['score']),
            answer['text'].toString(),
          );
        }).toList()
      ],
    );
  }
}
