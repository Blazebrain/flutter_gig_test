import 'package:flutter/material.dart';

changeScreen(screen, context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return screen;
    }),
  );
}

changeScreenReplacement(screen, context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) {
      return screen;
    }),
  );
}
