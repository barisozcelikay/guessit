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
          scaffoldBackgroundColor: Color.fromARGB(255, 34, 34, 34),
          primaryColor: Color.fromARGB(255, 21, 21, 21),
        ),
        home: GuessItPage(
          title: "Guess IT",
        ));
  }
}
