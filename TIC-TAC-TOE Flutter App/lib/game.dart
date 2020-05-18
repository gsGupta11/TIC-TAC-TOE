import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// 0,1,2
// 3,4,5
// 6,7,8

// 0,3,6
// 1,4,7
// 2,5,8

// 0,4,8
// 2,4,6

class _HomeState extends State<Home> {
  String winner = '';
  bool tie = false;
  void checkTie() {
    int b = 0;
    for (String i in r) {
      if (i == "") {
        b = 1;
        break;
      }
    }
    if (b == 0 && winner == '') {
      setState(() {
        tie = true;
        winner = "Tie, No One";
      });
    }
  }

  void checkRow() {
    for (int i = 0; i < 3; i++) {
      if ((r[3 * i] == "0" && r[3 * i + 1] == "0" && r[3 * i + 2] == "0") ||
          (r[3 * i] == "*" && r[3 * i + 1] == "*" && r[3 * i + 2] == "*")) {
        setState(() {
          winner = r[3 * i];
        });
        break;
      }
    }
  }

  void checkDia() {
    if ((r[0] == "0" && r[4] == "0" && r[8] == "0") ||
        (r[0] == "*" && r[4] == "*" && r[8] == "*")) {
      setState(() {
        winner = r[0];
      });
    } else if ((r[2] == "0" && r[4] == "0" && r[6] == "0") ||
        (r[2] == "*" && r[4] == "*" && r[6] == "*")) {
      setState(() {
        winner = r[2];
      });
    }
  }

  void checkCol() {
    for (int i = 0; i < 3; i++) {
      if ((r[i] == "0" && r[i + 3] == "0" && r[i + 6] == "0") ||
          (r[i] == "*" && r[i + 3] == "*" && r[i + 6] == "*")) {
        setState(() {
          winner = r[i];
        });
        break;
      }
    }
  }

  void func2(int x) {
    if (check == '') {
      setState(() {
        r[x] = "0";
        rangarray[x] = Colors.green;
        check = "0";
      });
    } else {
      setState(() {
        if (check == "0" && r[x] == "") {
          r[x] = "*";
          check = "*";
          rangarray[x] = Colors.red;
        } else if (check == "*" && r[x] == "") {
          r[x] = "0";
          check = "0";
          rangarray[x] = Colors.green;
        }
      });
    }
    checkCol();
    checkDia();
    checkRow();
    checkTie();
  }

  List<Color> rangarray = [
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black,
    Colors.black
  ];
  String check = '';
  List<String> r = ['', '', '', '', '', '', '', '', ''];

  List<Container> func() {
    List<Container> x = [];
    for (int i = 0; i < 9; i++) {
      x.add(
        Container(
          color: rangarray[i],
          child: FlatButton(
            disabledColor: rangarray[i],
            onPressed: () {
              func2(i);
            },
            child: Text(
              r[i],
              style: TextStyle(
                fontSize: 70.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TIC TAC TOE",
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          margin: EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 10.0),
          child: winner == ""
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: func()),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                              color: Colors.red,
                              onPressed: () {
                                Navigator.pushReplacementNamed(context, "/");
                              },
                              child: Text(
                                "Reset",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                        ),
                      ],
                    )
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Game Over",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40.0,
                        ),
                      ),
                      Text(
                        "${winner} won the Game",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/");
                        },
                        child: Text("Play Again"),
                      )
                    ],
                  ),
                )),
    );
  }
}
