import 'package:Math_Electrical_Calculator/widgets/CustomGridView.dart';
import 'package:flutter/material.dart';

class NumberSystemCalculator extends StatefulWidget {
  @override
  _NumberSystemCalculatorState createState() => _NumberSystemCalculatorState();
}

class _NumberSystemCalculatorState extends State<NumberSystemCalculator> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  Widget customTextField(String label, TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: label),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Padding customRaisedButton(Function onpress) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        onPressed: onpress,
        child: Text(
          " Calculate",
        ),
      ),
    );
  }

  var x = [
    {"label": "+", "value": 0},
    {"label": "-", "value": 0},
    {"label": "*", "value": 0},
    {"label": "/", "value": 0},
  ];

  calculate() {
    try {
      int n1 = int.parse(
          int.parse(num1.text, radix: currentValue).toRadixString(10));
      int n2 = int.parse(
          int.parse(num2.text, radix: currentValue).toRadixString(10));
      x = [
        {"label": "+", "value": (n1 + n2).toRadixString(currentValue)},
        {"label": "-", "value": (n1 - n2).toRadixString(currentValue)},
        {"label": "*", "value": (n1 * n2).toRadixString(currentValue)},
        {"label": "/", "value": (n1 ~/ n2).toRadixString(currentValue)},
      ];
      setState(() {});
    } catch (Exception) {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Value Error"),
            content: Text("Enter a proper value"),
          ));
    }
  }

  var currentValue = 2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          value: currentValue,
          items: [
            DropdownMenuItem(child: Text("Binary"), value: 2),
            DropdownMenuItem(child: Text("Quinary"), value: 5),
            DropdownMenuItem(child: Text("Octal"), value: 8),
            DropdownMenuItem(child: Text("Hexadecimal"), value: 16),
          ],
          onChanged: (value) {
            setState(() {
              currentValue = value;
              x = [
                {"label": "+", "value": 0},
                {"label": "-", "value": 0},
                {"label": "*", "value": 0},
                {"label": "/", "value": 0},
              ];
              num1.text = "0";
              num2.text = "0";
            });
          },
        ),
        customTextField("Number-1", num1),
        customTextField("Number-2", num2),
        customRaisedButton(calculate),
        CustomGridView(x),
      ],
    );
  }
}
