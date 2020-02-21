import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// import './ui/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var data = await readData();
  if(data != null){
    String message = await readData();
    print("checking for saved data : $message");
    //print(message);
  }
  runApp(new MaterialApp(
    title: 'File Writer',
    home: new Home(),
  ));
}




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _enterDataField = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("File Writer"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: new Container(
          padding: const EdgeInsets.all(13.4),
          alignment: Alignment.topCenter,
          child: new ListTile(
            title: new TextField(
              controller: _enterDataField,
              decoration: InputDecoration(
                labelText: "Write Something",
              ),
            ),
            subtitle: new FlatButton(
                onPressed: () {
                  debugPrint(_enterDataField.text);
                  writeData(_enterDataField.text);
                },
                child: new Column(
                  children: <Widget>[
                    new Text("Save Data"),
                    new Padding(padding: new EdgeInsets.all(14.5)),
                    new Text("Saved Data Goes Here")
                  ],
                )),
          ),
        ));
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory);
  return directory.path;
}

Future<File> get _localFile async {
  final path = await _localPath;
  return new File('$path/data.txt');
}

Future<File> writeData(String message) async {
  final file = await _localFile;
  // write to file
  return file.writeAsString('$message');
}

Future<String> readData() async {
  try {
    // read
    final file = await _localFile;
    String data = await file.readAsString();
    return data;
  } catch (e) {
    return "Nothing Saved Yet.";
  }
}
