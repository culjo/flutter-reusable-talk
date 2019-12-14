import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {

  final String text;
  final Color textColor;


  MyBottomNavBar(this.text, {this.textColor = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, spreadRadius: 1.0, blurRadius: 1.0)
      ]),
      child: Row(
        children: <Widget>[
          InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: textColor,
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Text(
                "${this.text}",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, color: this.textColor,),
              ),
            ),
          )
        ],
      ),
    );
  }
}