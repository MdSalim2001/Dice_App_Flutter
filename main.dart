import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Dice'),
          backgroundColor: Colors.black54,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left_die = 1;
  int right_die = 1;
  var Win = "Lets roll";

  void Shuffle() {
    setState(() {
      left_die = Random().nextInt(6) + 1;
      right_die = Random().nextInt(6) + 1;
      if (left_die > right_die) {
        Win = "Left WON";
      } else if (left_die < right_die) {
        Win = "Right WON";
      } else {
        Win = "Its a DRAW";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Shuffle();
                  },
                  child: Image.asset(
                    'images/dice$left_die.png',
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Shuffle();
                  },
                  child: Image.asset(
                    'images/dice$right_die.png',
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Shuffle();
            },
            child: Text(
              Win,
              style: TextStyle(
                fontFamily: "sans",
                fontWeight: FontWeight.bold,
                color: Colors.yellow[300],
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
