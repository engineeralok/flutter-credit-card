import 'package:flutter/cupertino.dart';

class CustomFont extends StatelessWidget {
  final String inputText;
  final double fontSize;
  final String fontType;
  final FontWeight fontWeight;

  const CustomFont({
    super.key,
    required this.inputText,
    required this.fontSize,
    required this.fontType,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: TextStyle(
        fontFamily: fontType,
        fontWeight: fontWeight,
        fontSize: fontSize,
      ),
    );
  }
}
