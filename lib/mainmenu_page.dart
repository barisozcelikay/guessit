import 'package:flutter/material.dart';
import 'package:guessit/guessit_page.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0XFF0A0D22),
          primaryColor: Color(0XFF0A0D22)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Guess It"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GuessItPage(
                                title: "GuessIT",
                              )));
                },
                child: Container(
                  height: 200.0,
                  color: Colors.red,
                  child: Text("4 Digits"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GuessItPage(
                                title: "GuessIT",
                              )));
                },
                child: Container(
                  height: 100.0,
                  color: Colors.green,
                  child: Text("5 Digits"),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GuessItPage(
                                title: "GuessIT",
                              )));
                },
                child: Container(
                  color: Colors.blue,
                  child: Text("6 Digits"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
