import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() {
  runApp(
    MaterialApp(
      home: Calu(),
      theme: ThemeData(
          primaryColor: Colors.white,
          primaryColorDark: Colors.black,
          primaryColorLight: Color.fromARGB(255, 48, 28, 88),
          secondaryHeaderColor: Color.fromARGB(255, 185, 166, 19)),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class Calu extends StatefulWidget {
  @override
  _CaluState createState() => _CaluState();
}

class _CaluState extends State<Calu> {
  List button = [
    '(',
    ')',
    'DEL',
    'AC',
    '9',
    '8',
    '7',
    '÷',
    '6',
    '5',
    '4',
    '×',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    '+',
    '=',
  ];
  bool enableDark = false;
  String ans = '0';
  String val = '';
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Nischal Calculator",
              style: TextStyle(
                color: enableDark
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorDark,
              ),
            ),
            ToggleSwitch(
              iconSize: 22,
              initialLabelIndex: 0,
              activeFgColor: enableDark
                  ? Color.fromARGB(255, 15, 89, 238)
                  : Theme.of(context).primaryColorDark,
              inactiveFgColor: enableDark
                  ? Theme.of(context).primaryColor
                  : Color(0xfff4f1f2),
              activeBgColors: [
                [
                  enableDark
                      ? Color.fromARGB(255, 185, 166, 19)
                      : Color.fromARGB(255, 185, 166, 19),
                ],
                [
                  enableDark
                      ? Color.fromARGB(255, 17, 17, 17)
                      : Color.fromARGB(255, 23, 46, 122),
                ],
              ],
              inactiveBgColor: enableDark
                  ? Color.fromARGB(255, 48, 28, 88)
                  : Color.fromARGB(255, 48, 28, 88),
              minHeight: 30,
              minWidth: 40,
              totalSwitches: 2,
              onToggle: (index) {
                setState(() {
                  if (index == 0)
                    enableDark = false;
                  else
                    enableDark = true;
                });
              },
              icons: [
                CupertinoIcons.sun_max,
                CupertinoIcons.moon,
              ],
            )
          ],
        ),
        backgroundColor: enableDark
            ? Theme.of(context).primaryColorLight
            : Theme.of(context).secondaryHeaderColor,
      ),
      body: Column(
        children: [
          Container(
            width: w,
            height: h * 0.2,
            color: enableDark
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 5,
                    top: 10,
                    right: 5,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '$val',
                          style: TextStyle(
                              color: enableDark
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColorDark,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          '$ans',
                          style: TextStyle(
                            color: enableDark
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).primaryColorDark,
                            fontSize: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: enableDark ? Color(0xff2a2d37) : Color(0xfff4f1f2),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5),
                top: Radius.circular(5),
              ),
            ),
            padding: EdgeInsets.all(1),
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 7,
              children: [
                for (String icon in button)
                  GestureDetector(
                    onTap: () {
                      valUpdate(icon);
                    },
                    child: Container(
                      width: w * 0.05,
                      height: w * 0.05,
                      decoration: BoxDecoration(
                        color: (icon == 'AC' || icon == 'DEL')
                            ? Color.fromARGB(255, 214, 6, 6)
                            : (icon == '+' ||
                                    icon == '-' ||
                                    icon == '×' ||
                                    icon == '÷' ||
                                    icon == '=')
                                ? Color.fromARGB(255, 185, 166, 19)
                                : (icon == '(' || icon == ')')
                                    ? Colors.blueAccent
                                    : enableDark
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).primaryColorDark,
                        border: Border.all(
                          color: enableDark
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).primaryColorDark,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(
                        icon,
                        style: TextStyle(
                          fontSize: 20,
                          color: enableDark
                              ? Theme.of(context).primaryColorDark
                              : Theme.of(context).primaryColor,
                        ),
                      )),
                    ),
                  )
              ],
            ),
          ))
        ],
      ),
    ));
  }

  void valUpdate(String s) {
    if (s == '0') val = val + '0';
    if (s == '1') val = val + '1';
    if (s == '2') val = val + '2';
    if (s == '3') val = val + '3';
    if (s == '4') val = val + '4';
    if (s == '5') val = val + '5';
    if (s == '6') val = val + '6';
    if (s == '7') val = val + '7';
    if (s == '8') val = val + '8';
    if (s == '9') val = val + '9';
    if (s == '+') val = val + '+';
    if (s == '-') val = val + '-';
    if (s == '÷') val = val + '/';
    if (s == '×') val = val + '*';
    if (s == 'AC') {
      val = '';
      ans = '0';
    }
    if (s == 'DEL') {
      if (val == '')
        val = '';
      else
        val = val.substring(0, val.length - 1);
    }
    if (s == '(') val = val + '(';
    if (s == ')') val = val + ')';
    if (s == '.') val = val + '.';
    if (s == '=') {
      {
        ans = calc(val);
        val = '';
      }
    }
    setState(() {});
  }

  String calc(String v) {
    String modVal = v;
    Parser p = Parser();
    Expression e = p.parse(modVal);
    ContextModel cm = ContextModel();
    num eval = e.evaluate(EvaluationType.REAL, cm);
    String a = eval.toString();
    return a.length > 20 ? eval.toStringAsPrecision(16) : a;
  }
}
