import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  const ProgressButton(
      {this.showProgress = false,
      this.text,
      this.background,
      this.textColor,
      @required this.buttonPressed,
      this.margin});

  final bool showProgress;
  final VoidCallback buttonPressed;
  final text;
  final Color background; // = new Color(0xFFEB5757);
  final Color textColor;
  final EdgeInsets margin;

  bool get enabled => buttonPressed != null;

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: margin ?? new EdgeInsets.only(top: 40.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            this.showProgress
                ? new CircularProgressIndicator(
                    strokeWidth: 2.0,
                  )
                : new Expanded(
                    child: new RaisedButton(
                      onPressed: buttonPressed,

                      color: background,
                      // ??  Theme.of(context).accentColor,
                      textColor: textColor ?? Colors.black,
                      padding: new EdgeInsets.all(16.0),
                      child: new Text(this.text ?? ''),
                    ),
                  )
          ],
        ));
  }
}
