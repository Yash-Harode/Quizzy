import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quizzy/screens/loginPage.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

//Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'You are awesome!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          Text(
            'Score ' '$resultScore',
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ), //Text
          TextButton(
            onPressed: () => resetHandler(),
            child: Container(
              color: Color(0xFF00E676),
              padding: const EdgeInsets.all(14),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          CupertinoButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
              //login(loginID.text.toString(), password.toString());
            },
            color: Color(0xFF00E676),
            child: const Text(
              'Log Out',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color.fromARGB(219, 255, 17, 0)),
            ),
          ),
// FlatButton is deprecated and should not be used
// Use TextButton instead

// FlatButton(
//   child: Text(
//     'Restart Quiz!',
//   ), //Text
//   textColor: Colors.blue,
//   onPressed: resetHandler(),
// ), //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
