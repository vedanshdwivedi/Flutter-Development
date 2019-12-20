import 'package:flutter/material.dart';


/*
void main() {
  runApp(MyApp());
}

*/

// short-hand for above commented code
void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  // @decorators 
  
  @override
  Widget build(BuildContext context){
    return MaterialApp(home: Text("Vedansh"));
  }
}