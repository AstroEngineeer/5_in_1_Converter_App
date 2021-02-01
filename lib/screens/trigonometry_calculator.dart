import 'package:Math_Electrical_Calculator/widgets/CustomGridView.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TrigonometryCalculator extends StatefulWidget {
  @override
  _TrigonometryCalculatorState createState() => _TrigonometryCalculatorState();
}

class _TrigonometryCalculatorState extends State<TrigonometryCalculator> {
  TextEditingController degree = TextEditingController();
  var map = [
    {"label": "Sin", "value": 0.0},
    {"label": "Cos", "value": 0.0},
    {"label": "Tan", "value": 0.0},
    {"label": "Cosec", "value": 0.0},
    {"label": "Sec", "value": 0.0},
    {"label": "Cot", "value": 0.0},
    {"label": "ArcSin", "value": 0.0},
    {"label": "ArcCos", "value": 0.0},
    {"label": "ArcTan", "value": 0.0},
  ];
  calculate() {
    setState(() {
      var radians = double.parse(degree.text) * pi / 180;
      map = [
        {"label": "Sin", "value": sin(radians)},
        {"label": "Cos", "value": cos(radians)},
        {
          "label": "Tan",
          "value": double.parse(tan(radians).toStringAsFixed(1)) == 0 ||
                  double.parse(tan(radians).toStringAsFixed(1)) > 1.0 &&
                      radians != 0.0
              ? "Undefined"
              : tan(radians)
        },
        {
          "label": "Cosec",
          "value": double.parse(sin(radians).toStringAsFixed(1)) == 0.0
              ? "Undefined"
              : 1 / sin(radians)
        },
        {
          "label": "Sec",
          "value": double.parse(cos(radians).toStringAsFixed(1)) == 0
              ? "Undefined"
              : 1 / cos(radians)
        },
        {
          "label": "Cot",
          "value": double.parse(tan(radians).toStringAsFixed(1)) == 0
              ? "Undefined"
              : 1 / tan(radians)
        },
        {"label": "ArcSin", "value": asin(sin(radians))},
        {"label": "ArcCos", "value": acos(cos(radians))},
        {"label": "ArcTan", "value": atan(tan(radians))},
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: degree,
            decoration: InputDecoration(labelText: "Degree"),
            keyboardType: TextInputType.number,
          ),
        ),
        RaisedButton(
          onPressed: calculate,
          child: Text("Calculate"),
        ),
        CustomGridView(map),
      ],
    );
  }
}
