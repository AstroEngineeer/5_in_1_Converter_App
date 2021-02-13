import 'package:flutter/material.dart';

class MatrixCalculator extends StatefulWidget {
  @override
  _MatrixCalculatorState createState() => _MatrixCalculatorState();
}

class _MatrixCalculatorState extends State<MatrixCalculator> {
  TextEditingController rowController = TextEditingController();
  TextEditingController colController = TextEditingController();
  TextEditingController rowController1 = TextEditingController();
  TextEditingController colController1 = TextEditingController();
  TextEditingController numController = TextEditingController();
  TextEditingController numController1 = TextEditingController();

  bool create = false;
  List<List> matrix;
  int row = 0, column = 0;
  void createMatrix() {
    matrix = [];
    row = 0;
    column = 0;
    int r = int.parse(rowController.text);
    int c = int.parse(colController.text);
    for (int i = 0; i < r; i++) {
      List temp = [];
      for (int i = 0; i < c; i++) temp.add("0");
      matrix.add(temp);
    }
    setState(() {
      create = true;
    });
  }

  bool create1 = false;
  List<List> matrix1;
  int row1 = 0, column1 = 0;
  void createMatrix1() {
    matrix1 = [];
    row1 = 0;
    column1 = 0;
    int r = int.parse(rowController1.text);
    int c = int.parse(colController1.text);
    for (int i = 0; i < r; i++) {
      List temp = [];
      for (int i = 0; i < c; i++) temp.add("0");
      matrix1.add(temp);
    }
    setState(() {
      create1 = true;
    });
  }

  void add() {
    var value = int.parse(numController.text);
    var r = int.parse(rowController.text);
    var c = int.parse(colController.text);
    if (row < r) {
      if (column < c) {
        matrix[row][column] = value.toString();
        column++;
      } else {
        row++;
        column = 0;
        matrix[row][column] = value.toString();
        column++;
      }
    } else {}
    setState(() {
      numController.text = "";
    });
  }

  void add1() {
    var value = int.parse(numController1.text);
    var r = int.parse(rowController1.text);
    var c = int.parse(colController1.text);
    if (row1 < r) {
      if (column1 < c) {
        matrix1[row1][column1] = value.toString();
        column1++;
      } else {
        row1++;
        column1 = 0;
        matrix1[row1][column1] = value.toString();
        column1++;
      }
    } else {}
    setState(() {
      numController1.text = "";
    });
  }

  List<List> result;
  void createResult() {
    result = [];
    int r = int.parse(rowController.text);
    int c = int.parse(colController.text);
    for (int i = 0; i < r; i++) {
      List temp = [];
      for (int i = 0; i < c; i++) temp.add(0);
      result.add(temp);
    }
  }

  List<List> result1;
  void createResult1() {
    result1 = [];
    int r = int.parse(rowController.text);
    int c = int.parse(colController1.text);
    for (int i = 0; i < r; i++) {
      List temp = [];
      for (int i = 0; i < c; i++) temp.add(0);
      result1.add(temp);
    }
  }

  void addition() {
    createResult();
    var r = int.parse(rowController.text);
    var c = int.parse(colController.text);
    var r1 = int.parse(rowController1.text);
    var c1 = int.parse(colController1.text);
    if (r1 == r && c == c1) {
      for (int i = 0; i < r; i++)
        for (int j = 0; j < c; j++) {
          result[i][j] =
              (int.parse(matrix[i][j]) + int.parse(matrix1[i][j])).toString();
        }
      dialog("Addition");
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Row Column Miss-Match"),
            content: Text("Check if rows and columns are equal"),
          ));
    }
  }

  void subtract() {
    var r = int.parse(rowController.text);
    var c = int.parse(colController.text);
    var r1 = int.parse(rowController1.text);
    var c1 = int.parse(colController1.text);
    if (r1 == r && c == c1) {
      for (int i = 0; i < r; i++)
        for (int j = 0; j < c; j++) {
          result[i][j] =
              (int.parse(matrix[i][j]) - int.parse(matrix1[i][j])).toString();
        }
      dialog("Subtraction");
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Row Column Miss-Match"),
            content: Text("Check if rows and columns are equal"),
          ));
    }
  }

  void multiplication() {
    createResult1();
    var r = int.parse(rowController.text);
    var c = int.parse(colController.text);
    var c1 = int.parse(colController1.text);
    var r1 = int.parse(rowController1.text);
    if (c == r1) {
      for (int i = 0; i < r; ++i)
        for (int j = 0; j < c1; ++j)
          for (int k = 0; k < c; ++k) {
            int x = result1[i][j];
            x += int.parse(matrix[i][k]) * int.parse(matrix1[k][j]);
            result1[i][j] = x;
          }
      dialog1("Multiplication");
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Row Column Miss-Match"),
            content: Text(
                "Check if Cols in matrix 1 and rows in matrix 2 are equal"),
          ));
    }
  }

  void powerA() {
    createResult1();
    var r = int.parse(rowController.text);
    var c = int.parse(colController.text);
    if (c == r) {
      for (int i = 0; i < r; ++i)
        for (int j = 0; j < c; ++j)
          for (int k = 0; k < c; ++k) {
            int x = result1[i][j];
            x += int.parse(matrix[i][k]) * int.parse(matrix[k][j]);
            result1[i][j] = x;
          }
      dialog1("Power A");
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Row Column Miss-Match"),
            content: Text("Check if Cols and rows are equal"),
          ));
    }
  }

  void powerB() {
    createResult1();
    var r = int.parse(rowController.text);
    var c = int.parse(colController.text);
    if (c == r) {
      for (int i = 0; i < r; ++i)
        for (int j = 0; j < c; ++j)
          for (int k = 0; k < c; ++k) {
            int x = result1[i][j];
            x += int.parse(matrix1[i][k]) * int.parse(matrix1[k][j]);
            result1[i][j] = x;
          }
      dialog1("Power B");
    } else {
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("Row Column Miss-Match"),
            content: Text("Check if Cols and rows are equal"),
          ));
    }
  }

  void dialog(x) {
    showDialog(
      context: context,
      child: SimpleDialog(title: Text("$x"), children: [
        SizedBox(
          height: 20 * double.parse(rowController.text),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: result
                  .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: e
                            .map((e) => e == "0"
                                ? Text("0")
                                : Text(
                                    e,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                            .toList(),
                      ))
                  .toList()),
        ),
      ]),
    );
  }

  void dialog1(x) {
    showDialog(
      context: context,
      child: SimpleDialog(title: Text("$x"), children: [
        SizedBox(
          height: 20 * double.parse(rowController.text),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: result1
                  .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: e
                            .map((e) => e == 0
                                ? Text("0")
                                : Text(
                                    e.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))
                            .toList(),
                      ))
                  .toList()),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
              child: TextField(
                decoration: InputDecoration(labelText: "Rows"),
                keyboardType: TextInputType.number,
                controller: rowController,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
              child: TextField(
                decoration: InputDecoration(labelText: "Columns"),
                keyboardType: TextInputType.number,
                controller: colController,
              ),
            ),
            RaisedButton(
              onPressed: createMatrix,
              child: Text("Create"),
              color: Colors.teal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                decoration: InputDecoration(labelText: "Value"),
                keyboardType: TextInputType.number,
                controller: numController,
              ),
            ),
            RaisedButton(
              onPressed: add,
              child: Text("Add"),
              color: Colors.teal,
            ),
            RaisedButton(
              onPressed: powerA,
              child: Text("Power"),
              color: Colors.teal,
            ),
          ],
        ),
        create
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20 * double.parse(rowController.text),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: matrix
                          .map((e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: e
                                    .map((e) => Text(
                                          e,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    .toList(),
                              ))
                          .toList()),
                ),
              )
            : Text(""),
        Divider(
          thickness: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
              child: TextField(
                decoration: InputDecoration(labelText: "Rows"),
                keyboardType: TextInputType.number,
                controller: rowController1,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .3,
              child: TextField(
                decoration: InputDecoration(labelText: "Columns"),
                keyboardType: TextInputType.number,
                controller: colController1,
              ),
            ),
            RaisedButton(
              onPressed: createMatrix1,
              child: Text("Create"),
              color: Colors.teal,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                decoration: InputDecoration(labelText: "Value"),
                keyboardType: TextInputType.number,
                controller: numController1,
              ),
            ),
            RaisedButton(
              onPressed: add1,
              child: Text("Add"),
              color: Colors.teal,
            ),
            RaisedButton(
              onPressed: powerB,
              child: Text("Power"),
              color: Colors.teal,
            ),
          ],
        ),
        create1
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20 * double.parse(rowController1.text),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: matrix1
                          .map((e) => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: e
                                    .map((e) => Text(
                                          e,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ))
                                    .toList(),
                              ))
                          .toList()),
                ),
              )
            : Text(""),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RaisedButton(
              onPressed: addition,
              child: Text("Add"),
            ),
            RaisedButton(
              onPressed: subtract,
              child: Text("Sub"),
            ),
            RaisedButton(
              onPressed: multiplication,
              child: Text("Multiply"),
            ),
          ],
        ),
      ],
    );
  }
}
