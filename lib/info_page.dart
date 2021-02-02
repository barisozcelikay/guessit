import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.info,
                            size: 36,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            'Welcome To GuessIT !',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                              "Rules are simple. Guess the number as fast as you can.\n\n> If you get '+' :  You guessed a number and some of your digits on your number are same and correct position with computer's.\n> If you get '-' :  You guessed a number and some of your digits on your number are same but they are not in same position with yours with computer's.",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(height: 1.5)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.history,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                  'Button helps you to remind what you guessed. You can see your last guess at the top.',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Flexible(
                                child: Text(
                                    'Button helps you to delete all numbers what you choosed.',
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Placeholder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//If you get '-' :  You guessed a number and some of your digits on your number are same but they are not in same position with yours. with computer's. "
