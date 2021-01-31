import 'dart:collection';

import 'package:flutter/material.dart';
import 'result.dart';

class HistoryPage extends StatelessWidget {
  Queue<Result> result;
  HistoryPage(this.result);

  @override
  Widget build(BuildContext context) {
    var historylist = result.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("HISTORY"),
      ),
      body: Center(
          child: ListView.builder(
        itemCount: historylist.length,
        itemBuilder: (context, index) {
          var item = historylist.elementAt(index);
          if (item.result != null) {
            return Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white)),
              child: ListTile(
                title: Text(
                  item.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
