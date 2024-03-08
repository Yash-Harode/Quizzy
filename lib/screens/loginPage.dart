// ignore: file_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/widgets/alert.dart';
import 'package:quizzy/screens/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  TextEditingController loginID = TextEditingController();
  TextEditingController password = TextEditingController();

  bool checkValue() {
    String id = loginID.text.trim();
    String pass = password.text.trim();

    if (id == "" || pass == "") {
      showDialog(
          context: context,
          builder: (_) {
            return AlertWidget(content: "Fill all fields.");
          });
      return false;
    }
    if (pass.length < 8) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertWidget(content: "Password length must be atleast 8.");
          });
      return false;
    }
    if (!id.endsWith("@gmail.com")) {
      showDialog(
          context: context,
          builder: (_) {
            return AlertWidget(content: "Use a valid email.");
          });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
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
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/log.jpg"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: 350,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: loginID,
                      decoration:
                          const InputDecoration(labelText: "Email Address"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(labelText: "Password"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Container(
                  alignment: Alignment.topRight,
                  child: RichText(
                    text: TextSpan(
                      text: "Forgot Password?",
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = (() {
                          print("Can't change password.");
                        }),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CupertinoButton(
                  onPressed: () {
                    if (checkValue()) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                      const HomePage();
                      //login(loginID.text.toString(), password.toString());
                    }
                  },
                  color: Color(0xFF00E676),
                  child: const Text('Log In'),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                            text: "New to Logistics?",
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        TextSpan(
                          text: " Register",
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = (() {
                              print("Not developped Register Page");
                            }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ),
        ]),
      ),
    );
  }

  // Future<void> login(String email, String password) async {
  //   try {
  //     Response response = await post(
  //       Uri.parse("https://reqres.in/api/register"),
  //       body: {
  //         'email': email,
  //         'password': password,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       print("Login Successfully");
  //       Navigator.popUntil(context, (route) => route.isFirst);
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) {
  //           return HomePage();
  //         }),
  //       );
  //     } else {
  //       print("Failed");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
