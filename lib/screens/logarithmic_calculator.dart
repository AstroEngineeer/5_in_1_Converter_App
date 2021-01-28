import "package:flutter/material.dart";
import 'dart:math';

class LogarithmicCalculator extends StatefulWidget {
  @override
  _LogarithmicCalculatorState createState() => _LogarithmicCalculatorState();
}

class _LogarithmicCalculatorState extends State<LogarithmicCalculator> {
  TextEditingController n = TextEditingController();
  TextEditingController base = TextEditingController();
  double result = 0.0;
  baseLog() {
    if (base.text == "e") {
      base.text = "10";
    }
    setState(() {
      result = log(int.parse(n.text)) / log(int.parse(base.text));
    });
  }

  naturalLog() {
    if (base.text == "e") {
      base.text = "10";
    }
    setState(() {
      result = log(int.parse(n.text));
      base.text = "e";
    });
  }

  antiLog() {
    if (base.text == "e") {
      base.text = "10";
    }
    setState(() {
      result = pow(double.parse(n.text), double.parse(base.text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: n,
            decoration: InputDecoration(labelText: "Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: base,
            decoration: InputDecoration(labelText: "Base"),
            keyboardType: TextInputType.number,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(onPressed: baseLog, child: Text("Log")),
              RaisedButton(onPressed: naturalLog, child: Text("Natural-Log")),
              RaisedButton(onPressed: antiLog, child: Text("Anti-Log"))
            ],
          ),
        ),
        Divider(
          height: 2,
          thickness: 5,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Text(
            "Result : " + result.toStringAsFixed(10),
            style: TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
