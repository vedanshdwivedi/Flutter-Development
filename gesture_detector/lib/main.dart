import 'package:flutter/material.dart';
import './home.dart';

void main() {
  var title = 'Gesture Detector';
  runApp(new MaterialApp(
    title: title,
    home: new Home(title),
  ));
}