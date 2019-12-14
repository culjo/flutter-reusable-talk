import 'package:flutter/material.dart';
import 'package:vibrate/vibrate.dart';

mixin UiSteroids {
  Future<bool> canVibrate() async {
    return await Vibrate.canVibrate;
  }

  void hapticErrorFeedback() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.error);
    }
  }

  void hapticWarningFeedback() async {
    bool canVibrate = await Vibrate.canVibrate;
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.warning);
    }
  }

  void hapticSuccessFeedback() {
    Vibrate.canVibrate.then((sure) {
      if (sure) {
        Vibrate.feedback(FeedbackType.success);
      }
    });
  }

  void hapticSelectionFeedback() async {
    bool canVibrate = await this.canVibrate();
    if (canVibrate) {
      Vibrate.feedback(FeedbackType.selection);
    }
  }

  void showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              "Please Wait...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 30.0),
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LimitedBox(
                    maxWidth: 28.0,
                    maxHeight: 28.0,
                    child: Container(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  Future<bool> showAlertDialog(
      BuildContext context, {
        String title = "",
        String positiveBtnText = "Ok",
        String negativeBtnText = "Cancel",
        VoidCallback onPositiveBtnClicked,
      }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 30.0),
          actions: <Widget>[
            FlatButton(
                onPressed: onPositiveBtnClicked, child: Text(positiveBtnText)),
            FlatButton(
                onPressed: () {
                  Navigator.of(context, rootNavigator: true).pop(false);
                },
                child: Text(negativeBtnText)),
          ],
        );
      },
    );
  }

  Future showBottomNotification(BuildContext context,
      {bool success = false, String title, String message}) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 200.0,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    title ?? "Information",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: success
                      ? Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 42.0,
                  )
                      : Icon(
                    Icons.cancel,
                    color: Colors.red.shade200,
                    size: 42.0,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 0.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          elevation: 1.0,
                          onPressed: () {
                            // Todo: Use a shouldNavigate params to specify if this should be possible
//                            if (success) {
//                              Navigator.of(context).popUntil(ModalRoute.withName("/home"));
//                            } else {
                            Navigator.of(context).pop();
//                            }
                          },
                          color: Colors.white,
                          child: Text(
                            success ? "Done" : "Close",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
