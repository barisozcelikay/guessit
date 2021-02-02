import 'dart:collection';

import 'package:flutter/material.dart';
import 'result.dart';

// ignore: must_be_immutable
class HistoryPage extends StatelessWidget {
  Queue<Result> result;
  HistoryPage(this.result);

  @override
  Widget build(BuildContext context) {
    var historylist = result.toList();
    return Scaffold(
        appBar: AppBar(
          title: Text("Guess History"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
              child: ListView.builder(
            itemCount: historylist.length,
            itemBuilder: (context, index) {
              var item = historylist.elementAt(index);
              if (item.result != null) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey,
                  ),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      item.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .copyWith(fontSize: 16),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          )),
        ));
  }
}
