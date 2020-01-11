import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cat = 0;
  double a, b, w, h;
  Color _textRang = Colors.red[300];
  String _finalText = "";
  final TextEditingController _BMIAge = new TextEditingController();
  final TextEditingController _BMIWeight = new TextEditingController();
  final TextEditingController _BMIHeight = new TextEditingController();

  String formatFinalText(double age, double bmi) {
    if (age > 17.0 && age < 66) {
      if (bmi > 25) {
        cat = 3;
        return "Overweight";
        _textRang = Colors.red;
      } else {
        if (bmi < 18.5) {
          cat = 1;
          return "Underweight";
          _textRang = Colors.red;
        } else {
          cat = 2;
          return "Healthy";
          _textRang = Colors.green;
        }
      }
    } else {
      cat=4;
      return "BMI is calculated for age 18-65";
    }
  }

  void calculateBMI() {
    setState(() {
      a = double.parse(_BMIAge.text);
      w = double.parse(_BMIWeight.text);
      h = double.parse(_BMIHeight.text);
      h = h / 100; // to get height in metres
      h = h * h;
      b = w / h;
      _finalText = formatFinalText(a, b);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI App"),
        backgroundColor: Colors.redAccent,
      ),
      body: new Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              width: 100,
              height: 150,
            ),

            Container(
              padding: new EdgeInsets.all(5),
              alignment: Alignment.center,
              color: Colors.grey[300],
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _BMIAge,
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: false),
                    decoration: InputDecoration(
                        labelText: "Age",
                        hintText: "Age",
                        icon: Icon(Icons.person)),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new TextField(
                    controller: _BMIHeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height",
                        hintText: "in cms",
                        icon: Icon(Icons.format_line_spacing)),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(5.0),
                  ),
                  new TextField(
                    controller: _BMIWeight,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Weight",
                        hintText: "in kgs",
                        icon: Icon(Icons.filter_list)),
                  ),
                  Padding(
                    padding: new EdgeInsets.all(15.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: calculateBMI,
                        child: Text("Calculate"),
                        color: Colors.red[300],
                      )
                    ],
                  )
                ],
              ),
            ),

            Padding(
              padding: new EdgeInsets.all(10),
            ),

            // Show Text
            Center(
              child: Text(
                cat == 0 ? "Enter your Details" : "$_finalText",
                style: new TextStyle(
                    fontSize: 19.3,
                    color: _textRang,
                    fontWeight: FontWeight.w700),
              ),
            ),

            Padding(
              padding: new EdgeInsets.all(10),
            ),

            // Show Text
            Center(
              child: Text(
                cat == 0 || cat == 4 ? "" : "Your BMI is : ${b.toStringAsFixed(1)}",
                style: new TextStyle(
                    fontSize: 19.3,
                    color: _textRang,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
