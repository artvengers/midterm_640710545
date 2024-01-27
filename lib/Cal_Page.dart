import 'package:flutter/material.dart';

class CalPage extends StatefulWidget {
  const CalPage({super.key});

  @override
  State<CalPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CalPage> {
  static const addSign = "\u002B";
  static const subtractSign = "\u2212";
  static const multiplySign = "\u00D7";
  static const divideSign = "\u00F7";
  static const equalSign = "\u003D";
  var ans = "0";

  Widget butfirst(String t) {
    return InkWell(
      onTap: () {
        setState(() {
          ans = "0";
        });
      },
      child: Container(
        height: 100,
        width: 300,
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 236, 231, 231)),
        child: Center(
            child: Text(
          t,
          style: TextStyle(fontSize: 30),
        )),
      ),
    );
  }

  Widget butde() {
    return InkWell(
      onTap: () {
        setState(() {
          if (ans.length == 1) {
            ans = "0";
          } else {
            ans = ans.substring(0, ans.length - 1);
          }
        });
      },
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 100,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 236, 231, 231),
            ),
            child: Center(
              child: Icon(Icons.backspace_outlined),
            ),
          ),
        ),
      ),
    );
  }

  Widget butNum(int number) {
    return InkWell(
      onTap: () {
        setState(() {
          if (ans[0] == "0" && ans.length == 1) {
            ans = number.toString();
          } else {
            ans = ans + number.toString();
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 70,
          height: 70,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
          child: Column(
            children: [
              Text(
                number.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget butfun(String f) {
    return InkWell(
      onTap: () {
        setState(() {
          if (f == equalSign) {
            ans = "0";
          } else if (ans.substring(ans.length - 1) == subtractSign) {
            ans = ans.substring(0, ans.length - 1) + f;
          } else if (ans.substring(ans.length - 1) == multiplySign) {
            ans = ans.substring(0, ans.length - 1) + f;
          } else if (ans.substring(ans.length - 1) == divideSign) {
            ans = ans.substring(0, ans.length - 1) + f;
          } else if (ans.substring(ans.length - 1) == addSign) {
            ans = ans.substring(0, ans.length - 1) + f;
          } else {
            ans = ans + f;
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 70,
          height: 70,
          padding: EdgeInsets.all(18),
          decoration:
              BoxDecoration(color: const Color.fromARGB(255, 236, 231, 231)),
          child: Column(
            children: [
              Text(
                f,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget butequ(String f) {
    return InkWell(
      onTap: () {
        setState(() {
          ans = "0";
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 70,
          height: 100,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(color: Color.fromARGB(255, 3, 47, 143)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                f,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.calculate,
                color: Colors.blue,
              ),
            ),
            Text("MY CALCULATOR"),
          ],
        ),
      ),
       body: LayoutBuilder(
    builder: (context, constraints) {
      return Column(
        children: [
          Row(
            children: [
              Spacer(),
              Text(
                ans.toString(),
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: butfirst("C"),
                      ),
                    ),
                    Expanded(
                      child: butde(),
                    ),
                  ],
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: butNum(7)),
                      Expanded(child: butNum(8)),
                      Expanded(child: butNum(9)),
                      Expanded(child: butfun(divideSign))
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: butNum(4)),
                      Expanded(child: butNum(5)),
                      Expanded(child: butNum(6)),
                      Expanded(child: butfun(multiplySign))
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: butNum(1)),
                      Expanded(child: butNum(2)),
                      Expanded(child: butNum(3)),
                      Expanded(child: butfun(subtractSign))
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(flex: 3, child: butNum(0)),
                      Expanded(child: butfun(addSign))
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: butequ(equalSign)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  ),
);
  }
}
