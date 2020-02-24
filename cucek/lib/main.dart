import 'package:flutter/material.dart';


import './ui/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    title: 'Cucek Attendance',
    home: Home(),
  )); 
}