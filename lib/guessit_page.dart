import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:guessit/computers_num.dart';
import 'package:guessit/history_page.dart';
import 'package:guessit/info_page.dart';
import 'package:guessit/result.dart';
import 'package:guessit/reusablenum_card.dart';
import 'constants.dart';
import 'customalert.dart';
import 'roundnumbutton.dart';
import 'result.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class GuessItPage extends StatefulWidget {
  GuessItPage({this.title});
  final String title;

  @override
  _GuessItPageState createState() => _GuessItPageState();
}

class _GuessItPageState extends State<GuessItPage> {
  bool isGameFinnished = false;
  Queue<Result> resulta = new Queue<Result>(); // Queue abstract
  List<String> mainNums = [" ", " ", " ", " "]; // başlangıç
  String result = "";

  int emptySlot() {
    // boş yer varsa dolduruyo
    int slot = 4; // if it returns 4 it means there is no empty slot.
    for (var i = 0; i < mainNums.length; i++) {
      if (mainNums[i] == " ") {
        slot = i;
        return slot;
      }
    }
    return slot;
  }

  void addNumber({int empty_place, int num}) {
    // bulduğu boş slotu dolduruyo
    if (empty_place == 0 && num == 0) {
      CustomAlert cstdial = CustomAlert('You cannot start the guess with 0.',
          'Error', 'Understand', this.context);

      showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return cstdial.dialog;
        },
      );
    } else {
      mainNums[empty_place] = num.toString();
    }
  }

  List<int> com = Computers_Num().random();

  List<int> restart(bool isgamefinnished) {
    if (isgamefinnished == true) {
      resulta.clear();
      com = Computers_Num().random();
      CustomAlert cstdial =
          CustomAlert('You win!.', 'Info', 'OK', this.context);

      showDialog(
        context: this.context,
        builder: (BuildContext context) {
          return cstdial.dialog;
        },
      );
      result = " ";
      mainNums = [" ", " ", " ", " "];
      isgamefinnished = false;
      return com;
    }
  }

  String check_numbers(List<int> com, List<String> inp) {
    try {
      int pozitive_count = 0, negative_count = 0;
      String result = " ";
      List<int> inp_digits = inp.map(int.parse).toList();

      if (Computers_Num().inputchecker(inp) == false) {
        CustomAlert cstdial = CustomAlert(
            'You entered same numbers.', 'Warning', 'Understand', this.context);

        showDialog(
          context: this.context,
          builder: (BuildContext context) {
            return cstdial.dialog;
          },
        );
      } else {
        for (int i = 0; i < inp_digits.length; i++) {
          for (int j = 0; j < inp_digits.length; j++) {
            if (inp_digits[i] == com[j] && i == j) {
              pozitive_count++;
            } else if (inp_digits[i] == com[j] && i != j) {
              negative_count++;
            }
          }
        }

        if (pozitive_count != 0 && negative_count != 0) {
          print("+ $pozitive_count   -  $negative_count");
          result = "+ $pozitive_count   -  $negative_count";
        } else if (pozitive_count == 0 && negative_count != 0) {
          print("-  $negative_count");
          result = "-  $negative_count";
        } else if (pozitive_count != 0 && negative_count == 0) {
          if (pozitive_count == 4) {
            result = "You win";
            print("You win");
          } else {
            print("+ $pozitive_count");
            result = "+ $pozitive_count";
          }
        } else if (pozitive_count == 0 && negative_count == 0) {
          result = "Nothing";
        }

        return result;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.history,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HistoryPage(resulta)));
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InfoPage()));
            },
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  //  color: Colors.green,
                  child: Row(
                    children: [
                      Flexible(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 120),
                          child: ReusableNumCard(
                              colour: kActiveCardColour,
                              cardChild: Center(
                                child: Text(
                                  mainNums[0],
                                  textAlign: TextAlign.center,
                                  style: kLabelTextStyle,
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 120),
                          child: ReusableNumCard(
                              colour: kActiveCardColour,
                              cardChild: Center(
                                child: Text(
                                  mainNums[1],
                                  textAlign: TextAlign.center,
                                  style: kLabelTextStyle,
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 120),
                          child: ReusableNumCard(
                              colour: kActiveCardColour,
                              cardChild: Center(
                                child: Text(
                                  mainNums[2],
                                  textAlign: TextAlign.center,
                                  style: kLabelTextStyle,
                                ),
                              )),
                        ),
                      ),
                      Flexible(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 120),
                          child: ReusableNumCard(
                              colour: kActiveCardColour,
                              cardChild: Center(
                                child: Text(
                                  mainNums[3],
                                  textAlign: TextAlign.center,
                                  style: kLabelTextStyle,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      (() {
                        if (result == null) {
                          return " ";
                        } else {
                          return result;
                        }
                      }()),
                      style: kResultTextStyle,
                    ),
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              size: 32,
                            ),
                            onPressed: () {
                              setState(() {
                                if (mainNums.isEmpty == false) {
                                  mainNums = [" ", " ", " ", " "];
                                }
                              });
                            },
                          ),
                        )),
                    Wrap(
                      runSpacing: 40,
                      children: [
                        RoundNumButton(
                          num: 0,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 0);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 1,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 1);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 2,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 2);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 3,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 3);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 4,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 4);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 5,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 5);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 6,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 6);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 7,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 7);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 8,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 8);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        RoundNumButton(
                          num: 9,
                          onPress: () {
                            setState(() {
                              if (emptySlot() < 4) {
                                int slot = emptySlot();
                                addNumber(empty_place: slot, num: 9);
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(40),
                width: double.infinity,
                height: 70,
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      result = check_numbers(com, mainNums);
                      resulta.addFirst(Result(mainNums, result));
                    });
                    if (result != "You win") {
                      mainNums = [
                        " ",
                        " ",
                        " ",
                        " "
                      ]; // burda eğer hepsini bilmediği zaman baştaki 4 numarayı boşluk atıyorum
                    } else if (result == "You win") {
                      isGameFinnished = true;
                      com = restart(isGameFinnished);
                      print(com);
                    }
                  },
                  color: Colors.blueGrey,
                  child: Text(
                    'GUESS IT',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
