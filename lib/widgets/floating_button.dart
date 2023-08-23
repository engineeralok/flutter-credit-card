import 'package:flutter/material.dart';

Container addCardButtonFloatingButton({
  required Icon icon,
  required Color color,
  required VoidCallback onPressed,
}) {
  return Container(
    margin: const EdgeInsets.only(top: 24.0),
    // alignment: Alignment.center,
    child: FloatingActionButton(
      elevation: 2.0,
      onPressed: onPressed,
      backgroundColor: color,
      mini: false,
      child: icon,
    ),
  );
}
