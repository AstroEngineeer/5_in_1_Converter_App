import 'package:flutter/material.dart';

class ElectricalCalculator extends StatefulWidget {
  @override
  _ElectricalCalculatorState createState() => _ElectricalCalculatorState();
}

class _ElectricalCalculatorState extends State<ElectricalCalculator> {
  var currentValue = "Amps";
  var result = 0.0;

  TextEditingController a = TextEditingController();
  TextEditingController b = TextEditingController();

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

  calculateAmps() {
    setState(() {
      var watts = double.parse(a.text);
      var volts = double.parse(b.text);
      result = watts / volts;
    });
  }

  amps() {
    return Column(children: [
      customTextField("Watts", a),
      customTextField("Volts", b),
      customRaisedButton(calculateAmps),
      Text(
        "Amps : " + result.toStringAsFixed(3).toString() + " A",
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }

  calculatewatts() {
    setState(() {
      var watts = double.parse(a.text);
      var volts = double.parse(b.text);
      result = watts * volts;
    });
  }

  watts() {
    return Column(children: [
      customTextField("Amps", a),
      customTextField("Volts", b),
      customRaisedButton(calculatewatts),
      Text(
        "Watts : " + result.toStringAsFixed(3).toString() + " W (or) VA",
        style: TextStyle(fontSize: 20),
      ),
      Text(
        "KiloWatts : " +
            (result / 1000).toStringAsFixed(3).toString() +
            " kW (or) kVA",
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }

  calculatevolts() {
    setState(() {
      var watts = double.parse(a.text);
      var volts = double.parse(b.text);
      result = watts * volts;
    });
  }

  volts() {
    return Column(children: [
      customTextField("Amps", a),
      customTextField("Resistance", b),
      customRaisedButton(calculatevolts),
      Text(
        "Volts : " + result.toStringAsFixed(3).toString() + " V",
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }

  calculatejoules() {
    setState(() {
      var watts = double.parse(a.text);
      var volts = double.parse(b.text);
      result = watts * volts;
    });
  }

  joules() {
    return Column(children: [
      customTextField("Watts", a),
      customTextField("Time in seconds", b),
      customRaisedButton(calculatejoules),
      Text(
        "Joules : " + result.toStringAsFixed(3).toString() + " J",
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }

  calculatewh() {
    setState(() {
      var watts = double.parse(a.text);
      var volts = double.parse(b.text);
      result = watts * volts;
    });
  }

  wh() {
    return Column(children: [
      customTextField("Watts", a),
      customTextField("Hours", b),
      customRaisedButton(calculatewh),
      Text(
        "Watt-Hours : " + result.toStringAsFixed(3).toString() + " Wh",
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }

  calculatemAh() {
    setState(() {
      var watts = double.parse(a.text);
      var volts = double.parse(b.text);
      result = watts / volts;
    });
  }

  mAh() {
    return Column(children: [
      customTextField("Watt-Hours", a),
      customTextField("Volts", b),
      customRaisedButton(calculatemAh),
      Text(
        "MilliApm-Hours : " +
            (1000 * result).toStringAsFixed(3).toString() +
            " mAh",
        style: TextStyle(fontSize: 20),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton(
          value: currentValue,
          items: [
            DropdownMenuItem(child: Text("Amps"), value: "Amps"),
            DropdownMenuItem(child: Text("Watts / VA"), value: "Watts"),
            DropdownMenuItem(child: Text("Volts"), value: "Volts"),
            DropdownMenuItem(child: Text("Joules"), value: "Joules"),
            DropdownMenuItem(child: Text("Wh"), value: "Wh"),
            DropdownMenuItem(child: Text("mAh"), value: "mAh"),
          ],
          onChanged: (value) {
            setState(() {
              result = 0.0;
              currentValue = value;
              a.text = "";
              b.text = "";
            });
            print(value);
          },
        ),
        currentValue == "Amps"
            ? amps()
            : currentValue == "Watts"
                ? watts()
                : currentValue == "Volts"
                    ? volts()
                    : currentValue == "Joules"
                        ? joules()
                        : currentValue == "Wh"
                            ? wh()
                            : currentValue == "mAh"
                                ? mAh()
                                : Container(),
      ],
    );
  }
}
