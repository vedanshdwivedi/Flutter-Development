import 'package:flutter/material.dart';

import './utils/database_utils.dart';
import './ui/home.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    title: 'Cucek Attendance',
    home: Home(),
  )); 
}