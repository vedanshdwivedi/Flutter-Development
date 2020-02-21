import 'package:flutter/material.dart';

import './utils/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'No Todo',
    home: new Home(),
  ));
}
