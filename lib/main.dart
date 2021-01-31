import 'package:flutter/material.dart';
import 'guessit_page.dart';

void main() {
  runApp(GuessIt());
}

class GuessIt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0XFF0A0D22),
            primaryColor: Color(0XFF0A0D22)),
        home: GuessItPage(
          title: "Guess IT",
        ));
  }
}
