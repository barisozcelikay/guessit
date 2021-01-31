import 'dart:collection';

import 'package:flutter/material.dart';
import 'result.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About GuessIT"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Welcome To GuessIT\nRules are simple. Guess the number as fast as you can.\n\n\n\If you get '+' :  You guessed a number and some of your \ndigits on your number are same and correct position \nwith computer's.\n\nIf you get '-' :  You guessed a number and some of your \ndigits on your number are same but they are not in \nsame position with yours. with computer's."),
            SizedBox(
              height: 40.0,
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.history,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                      "Button helps you to remind what you guessed. You \ncan see your last guess at the top.")
                ],
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              padding: EdgeInsets.only(right: 25.0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  Text(
                      "Button helps you to delete all numbers what you \nchoosed. ")
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "GUESS IT",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }
}
//If you get '-' :  You guessed a number and some of your digits on your number are same but they are not in same position with yours. with computer's. "
