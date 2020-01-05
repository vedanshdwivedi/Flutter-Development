import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

class _LoginData {
  String name = "";
  String password = "";
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();
  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // add image
          Center(
            child: Image.asset("images/face.png",
                width: 90, height: 90, color: Colors.deepOrange),
          ),

          // Name Field
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3))),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Name";
                } else {
                  // show something
                  setState(() {
                    _data.name = value;
                  });
                  print("Data: ${_data.name}");
                }
              },
            ),
          ),

          // Password Field
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      gapPadding: 3.3,
                      borderRadius: BorderRadius.circular(3.3))),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please Enter Password";
                } else {
                  setState(() {
                    _data.password = value;
                  });
                }
              },
            ),
          ),

          // add buttons
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Add the actual buttons

                // Submit Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("All is good.")));
                      }
                    },
                    child: Text("Submit"),
                  ),
                ),

                // Clear Button
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState != null) {
                        // clear everything
                        _formKey.currentState.reset();
                        setState(() {
                          _data.name="";
                          _data.password="";
                        });
                      }
                    },
                    child: Text("Clear"),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: 
                _data.name.isEmpty ? Text("") : Text(
              "Welcome ${_data.name}",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.0,
                  color: Colors.deepOrange),
            )),
          ),
        ],
      ),
    );
  }
}
