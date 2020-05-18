import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/game.dart';
void main() {
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    routes: {
      "/":(context)=>Home()
    },
  ));
}
