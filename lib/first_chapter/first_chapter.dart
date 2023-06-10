import 'dart:math';
import 'package:flutter/material.dart';

Color? canBeNull;

void main() {
  canBeNull = Colors.amber;
  final colors = <Color>[Colors.red, Colors.pink];
  const color1 = Color.fromRGBO(63, 81, 181, 1);
  const color2 = Color.fromARGB(255, 14, 225, 60);

  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WidgetOne(
              colors: colors,
              text: 'hello',
            ),
            const WidgetTwo(color1, color2),
            const WidgetTwo.newConstructor(),
          ],
        ),
      ),
    ),
  );
}

class WidgetOne extends StatefulWidget {
  const WidgetOne({super.key, required this.colors, required this.text});

  final List<Color> colors;
  final String text;

  @override
  State<WidgetOne> createState() => _WidgetOneState();
}

class _WidgetOneState extends State<WidgetOne> {
  var assets = [
    'lib/assets/images/dice-1.png',
    'lib/assets/images/dice-2.png',
    'lib/assets/images/dice-3.png',
    'lib/assets/images/dice-4.png',
    'lib/assets/images/dice-5.png',
    'lib/assets/images/dice-6.png'
  ];
  // var imageDice = 'lib/assets/images/dice-6.png';
  final random = Random();
  var currentDice = 2;
  void rollDice() {
    currentDice = random.nextInt(6) + 1;
    // imageDice = 'lib/assets/images/dice-$random.png';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final gradientStyle = LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: widget.colors);
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        gradient: gradientStyle,
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'lib/assets/images/dice-$currentDice.png',
            // imageDice,
            fit: BoxFit.cover,
            width: 100,
            height: 100,
          ),
          // OutlinedButton(
          //   style: const ButtonStyle(
          //     backgroundColor: MaterialStatePropertyAll(Colors.black),
          //   ),
          //   onPressed: rollDice,
          //   child: const Text('roll dice'),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: TextButton(
              style: TextButton.styleFrom(
                // padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 25),
              ),
              onPressed: rollDice,
              child: const Text('roll dice'),
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetTwo extends StatelessWidget {
  const WidgetTwo(this.colo1, this.colo2, {super.key});
  const WidgetTwo.newConstructor({super.key})
      : colo1 = Colors.deepOrange,
        colo2 = Colors.yellow;
  final Color colo1;
  final Color colo2;

  @override
  Widget build(BuildContext context) {
    final gradientStyle = LinearGradient(
        begin: Alignment.center,
        end: Alignment.bottomCenter,
        colors: <Color>[colo1, colo2, Colors.black]);
    return Container(
      height: 20,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: gradientStyle,
      ),
    );
  }
}

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  @override
  Widget build(BuildContext context) {
    return const Text('hi');
  }
}
