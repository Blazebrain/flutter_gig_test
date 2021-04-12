import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final text;
  final color;
  final size;
  final weight;
  final wordSpacing;

  const CustomText(
      {Key key,
      this.text,
      this.color,
      this.size,
      this.weight,
      this.wordSpacing})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        wordSpacing: wordSpacing,
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    );
  }
}
