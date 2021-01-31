import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:guessit/computers_num.dart';
import 'package:guessit/history_page.dart';
import 'package:guessit/info_page.dart';
import 'package:guessit/result.dart';
import 'package:guessit/reusablenum_card.dart';
import 'constants.dart';
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
      Alert(
        context: context,
        type: AlertType.error,
        title: "SAME NUMBERS",
        desc: "4 DIGITS NUMBER DO NOT START WITH",
      ).show();
    } else {
      mainNums[empty_place] = num.toString();
    }
  }

  List<int> com = Computers_Num().random();

  List<int> restart(bool isgamefinnished) {
    if (isgamefinnished == true) {
      resulta.clear();
      com = Computers_Num().random();
      Alert(
        context: context,
        type: AlertType.success,
        title: "YOU WIN",
      ).show();
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
        Alert(
          context: context,
          type: AlertType.error,
          title: "SAME NUMBERS",
          desc: "You Entered Same Numbers.",
        ).show();
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
        title: Text(
          widget.title,
        ),
        actions: [
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: IconButton(
                icon: Icon(
                  Icons.history,
                  size: 30.0,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HistoryPage(resulta)));
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: 50.0, bottom: 20.0, left: 10.0, right: 10.0),
              height: 130.0,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      child: ReusableNumCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mainNums[0],
                          textAlign: TextAlign.center,
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableNumCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mainNums[1],
                          textAlign: TextAlign.center,
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableNumCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mainNums[2],
                          textAlign: TextAlign.center,
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  )),
                  Expanded(
                      child: ReusableNumCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          mainNums[3],
                          textAlign: TextAlign.center,
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: Text(
              (() {
                if (result == null) {
                  return " ";
                } else {
                  return result;
                }
              }()),
              style: kResultTextStyle,
            )),
            Expanded(
              child: Container(
                  width: 60,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red),
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
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: RoundNumButton(
                    num: 0,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 0);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 1,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 1);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 2,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 2);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 3,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 3);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 4,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 4);
                        }
                      });
                    },
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: RoundNumButton(
                    num: 5,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 5);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 6,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 6);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 7,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 7);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 8,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 8);
                        }
                      });
                    },
                  )),
                  Expanded(
                      child: RoundNumButton(
                    num: 9,
                    onPress: () {
                      setState(() {
                        if (emptySlot() < 4) {
                          int slot = emptySlot();
                          addNumber(empty_place: slot, num: 9);
                        }
                      });
                    },
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  result = check_numbers(com, mainNums);
                  resulta.addFirst(Result(mainNums, result));

                  //  HistoryPage(resulta);
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
              child: Container(
                margin: EdgeInsets.only(top: 30.0),
                padding: EdgeInsets.only(top: 10.0),
                height: 50.0,
                width: double.infinity,
                color: Colors.red,
                child: Text(
                  "GUESS IT",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
