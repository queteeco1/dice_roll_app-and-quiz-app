import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  static const startScreen = 'active-screen';
  static const questionScreen = 'question-screen';
  var activeScreen = startScreen;

  // Widget? activeWidget;

  /*void initState() {
    activeWidget = FirstWidget(changeWidget: changeWidget);
    super.initState();
  }*/

  void changeWidget() {
    activeScreen = questionScreen;
    // activeWidget = SecondWidget(comeBack: comeBack);
    setState(() {});
  }

  void comeBack() {
    activeScreen = startScreen;
    // activeWidget = FirstWidget(changeWidget: changeWidget);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen == startScreen
            ? FirstWidget(changeWidget: changeWidget)
            : SecondWidget(comeBack: comeBack),
        // activeWidget,
      ),
    );
  }
}

class FirstWidget extends StatelessWidget {
  const FirstWidget({super.key, required this.changeWidget});
  final void Function() changeWidget;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: changeWidget,
        child: const Text('first widget'),
      ),
    );
  }
}

class SecondWidget extends StatelessWidget {
  const SecondWidget({super.key, required this.comeBack});
  final void Function() comeBack;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: comeBack,
        child: const Text('comeback'),
      ),
    );
  }
}
