import 'package:flutter/material.dart';
import './loginapp.dart';

void main() {
  runApp(Login());
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login App',
      home: new Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: new AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Login Form App"),
        centerTitle: true,
      ),
      body: new CustomLoginForm(),
    ),
    );
  }
}
