import 'package:flutter/material.dart';

///Custom mmessage dialog class.
class CustomAlert {
  /// Message.
  String message = '';

  /// Title
  String title = '';

  /// Button name.
  String buttonname = '';

  /// App context for bulid widget.
  BuildContext x;

  /// Alert dialog.
  AlertDialog dialog;

  ///Custom mmessage dialog class constructor.
  ///[m] is mesage.
  ///[t] is title.
  ///[b] is button name.
  ///[c] is app context for bulid widget.
  CustomAlert(String m, String t, String b, BuildContext c) {
    message = m;
    title = t;
    buttonname = b;
    x = c;

    dialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: SingleChildScrollView(
        child: ListBody(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (() {
                    if (title == 'Error') {
                      return Colors.red;
                    } else if (title == 'Warning') {
                      return Colors.orange;
                    } else {
                      return Colors.green;
                    }
                  }())),
              child: Icon(
                (() {
                  if (title == 'Error') {
                    return Icons.error;
                  } else if (title == 'Warning') {
                    return Icons.warning;
                  } else {
                    return Icons.check_circle;
                  }
                }()),
                size: (() {
                  return title == 'Warning' ? 36.0 : 48.0;
                }()),
              ),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.center,
            ),
            Tooltip(
              message: message,
              child: Text(
                message,
                style: Theme.of(c).textTheme.bodyText2,
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Tooltip(
            message: '$buttonname button',
            child: Text(
              buttonname,
              style: TextStyle(
                  color: (() {
                if (title == 'Error') {
                  return Colors.red;
                } else if (title == 'Warning') {
                  return Colors.orange;
                } else {
                  return Colors.green;
                }
              }())),
            ),
          ),
          onPressed: () {
            Navigator.of(x).pop();
          },
        ),
      ],
    );
  }
}
