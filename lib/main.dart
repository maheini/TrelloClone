import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trelloclone/TodoList.dart';


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

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    if(_todoLists.isEmpty){
      _addNewListButton(_todoLists);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('TrelloClone  ${_todoLists.length}'),
        centerTitle: true,
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },),
        child: Scrollbar(
            isAlwaysShown: true,
            controller: scrollController,
            child: ListView(
              key: UniqueKey(),
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              children: _todoLists,
            )
        ),
      ),
    );
  }
  TextEditingController controller = TextEditingController();

  void _addNewListButton(List<Widget> todoLists){
    Widget addNewListButton = Column(
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
          child: Container(
            height: 40,
            width: double.infinity,
            margin: const EdgeInsets.all(5),
            child: TextButton(
              onPressed: () => setState(() {
                _addTodoList('', todoLists);
              }),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.05)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add),
                  Container(width: 10,),
                  const Text('add list'),
                ],
              ),
            ),
          ),
        ),
      ],
    );

    todoLists.add(addNewListButton);
  }

  void _addTodoList(String name, List<Widget> todoLists) {
    todoLists.last = TodoList(key: UniqueKey(), name: name,);

    _addNewListButton(todoLists);
  }
}
