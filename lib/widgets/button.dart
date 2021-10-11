import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Button extends StatelessWidget {

  Color colorButton;
  double? width;
  String text;
  Color textColor;
  double fontSize;
  bool bold = true;
  Function callback;


  Button(this.colorButton,this.text,this.textColor,this.fontSize,this.bold,this.callback,{this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: width,
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        onPressed: () {callback;},

        child: Text(text,style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: bold == true ? FontWeight.bold : FontWeight.normal)),
      ),
    );
  }
}
