import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: MainScreen()));
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> _todoLists = [];
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TrelloClone  ${_todoLists.length}'),
        centerTitle: true,
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        controller: scrollController,
        child: ListView(
          key: UniqueKey(),
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          children: _todoLists,
        )
        // child: ListView.builder(
        //     controller: scrollController,
        //     scrollDirection: Axis.horizontal,
        //     padding: const EdgeInsets.all(8),
        //     itemCount: _todoLists.length,
        //     itemBuilder: (BuildContext context, int index) {
        //
        //     }
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() {
          _addTodoList('name', _todoLists);
        })
      ),
    );
  }
  TextEditingController controller = TextEditingController();

  void _addTodoList(String name, List<Widget> todoLists) {
    controller.text = name;
    todoLists.add(Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          width: 350,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey[400]!, width: 2),
          ),
          child: Column(
            children: [
              TextField(textAlign: TextAlign.center, controller: controller),
              Text('Item1'),
              Text('Item2'),
            ],
          ),
        ),
      ],
    ));
  }
}
