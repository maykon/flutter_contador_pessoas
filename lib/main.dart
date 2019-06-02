import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Contador de Pessoas",
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _text = "Pode entrar!";
  var _textStyle = TextStyle(
      fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold);
  var _buttonTextStyle = TextStyle(fontSize: 40.0, color: Colors.white);

  void _changePeople(int delta) {
    setState(() {
      if (_people == 0 && delta == -1) return;
      _people += delta;
      _text = _people <= 10 ? "Pode entrar!" : "Lotado!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.00,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pessoas $_people",
              style: _textStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1", style: _buttonTextStyle),
                    onPressed: () {
                      _changePeople(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1", style: _buttonTextStyle),
                    onPressed: () {
                      _changePeople(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _text,
              style: _textStyle,
            ),
          ],
        ),
      ],
    ));
  }
}
