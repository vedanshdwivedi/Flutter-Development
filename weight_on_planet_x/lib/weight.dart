import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  @override
  _WeightState createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  final TextEditingController _weightController = new TextEditingController();

  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formattedText =
              "Your weight on Mercury is ${_finalResult.toStringAsFixed(1)} kgs";
          break;
        case 1:
          _finalResult = calculateWeight(_weightController.text, 2.34);
          _formattedText =
              "Your weight on Jupiter is ${_finalResult.toStringAsFixed(1)} kgs";
          break;
        case 2:
          _finalResult = calculateWeight(_weightController.text, 1.19);
          _formattedText =
              "Your weight on Neptune is ${_finalResult.toStringAsFixed(1)} kgs";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new  Container(
            alignment: Alignment.center,
            child: new ListView(
              padding: const EdgeInsets.all(2.5),
              children: <Widget>[
                new Image.asset('images/planet.png', height: 133, width: 200),
                new Container(
                  margin: const EdgeInsets.all(3.0),
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      new TextField(
                        controller: _weightController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Weight on Earth",
                            hintText: "in Kilograms",
                            icon: Icon(Icons.person_outline)),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(5.0),
                      ),

                      // three radio buttons
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Radio<int>(
                            activeColor: Colors.grey,
                            value: 0,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            "Mercury",
                            style: new TextStyle(color: Colors.white30),
                          ),
                          new Radio<int>(
                            activeColor: Colors.orange,
                            value: 1,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            "Jupiter",
                            style: new TextStyle(color: Colors.white30),
                          ),
                          new Radio<int>(
                            activeColor: Colors.blueAccent,
                            value: 2,
                            groupValue: radioValue,
                            onChanged: handleRadioValueChanged,
                          ),
                          new Text(
                            "Neptune",
                            style: new TextStyle(color: Colors.white30),
                          ),
                        ],
                      ),

                      // Result Text

                      new Padding(
                        padding: new EdgeInsets.all(15.6),
                      ),

                      Center(
                        child: new Text(
                            _weightController.text.isEmpty ? "Please Enter Weight" : "$_formattedText",
                            style: new TextStyle(
                                fontSize: 19.4,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                      ),


                    ],
                  ),
                ),
              ],
            ));
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return double.parse(weight) * multiplier;
    } else {
      print("Wrong");
      return double.parse("180") * 0.38;
    }
  }
}
