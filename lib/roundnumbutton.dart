import 'package:flutter/material.dart';

class RoundNumButton extends StatelessWidget {
  final Function onPress;
  final int num;
  RoundNumButton({this.onPress, this.num});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      onPressed: onPress,
      child: Text(num.toString()),
      constraints: BoxConstraints.tightFor(width: 60.0, height: 60.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4A4F5E),
    );
  }
}
