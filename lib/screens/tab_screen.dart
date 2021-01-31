import 'package:Math_Electrical_Calculator/screens/electrical_calculator.dart';
import 'package:Math_Electrical_Calculator/screens/logarithmic_calculator.dart';
import 'package:Math_Electrical_Calculator/screens/number_system_calculator.dart';
import 'package:Math_Electrical_Calculator/screens/trigonometry_calculator.dart';
import 'package:flutter/material.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var screens = [
    {"title": "Logarithmic Calculator", "screen": LogarithmicCalculator()},
    {"title": "Electrical Calculator", "screen": ElectricalCalculator()},
    {"title": "Trigonometry Calculator", "screen": TrigonometryCalculator()},
    {"title": "Number System Calculator", "screen": NumberSystemCalculator()},
    {"title": "Matrix Calculator", "screen": LogarithmicCalculator()},
  ];

  var apps = [
    {"label": "Log", "icon": Icons.ac_unit},
    {"label": "Electric", "icon": Icons.ac_unit},
    {"label": "TriG", "icon": Icons.ac_unit},
    {"label": "Number", "icon": Icons.ac_unit},
    {"label": "Matrix", "icon": Icons.ac_unit}
  ];

  int selectedIndex = 0;
  void selectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(screens[selectedIndex]["title"]),
      ),
      body: screens[selectedIndex]["screen"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        onTap: selectIndex,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: apps
            .map(
              (e) => BottomNavigationBarItem(
                  icon: Icon(e["icon"]), label: e["label"]),
            )
            .toList(),
      ),
    );
  }
}
