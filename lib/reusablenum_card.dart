import 'package:flutter/material.dart';

class ReusableNumCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;

  ReusableNumCard({@required this.colour, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: this.colour,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.grey,
          width: 3,
        ),
      ),
    );
  }
}
