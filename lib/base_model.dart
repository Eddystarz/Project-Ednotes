import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  setBusy(val) {
    _busy = val;
    notifyListeners();
    if (val == true) {
      return CircularProgressIndicator();
    }
  }

  showDialogue({required BuildContext context, message, Function? onTap}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Success"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('$message'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  onTap!() == null ? Navigator.of(context).pop() : onTap();
                },
              ),
            ],
          );
        });
  }

  showErrorDialogue({required BuildContext context, message, Function? onTap}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("An error occured"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('$message'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  onTap!() == null ? Navigator.of(context).pop() : onTap();
                },
              ),
            ],
          );
        });
  }
}
