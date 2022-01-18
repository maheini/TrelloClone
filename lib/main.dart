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
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => setState(() {
          _addTodoList('name $counter', _todoLists);
          counter++;
        })
      ),
    );
  }
  TextEditingController controller = TextEditingController();

  void _addTodoList(String name, List<Widget> todoLists) {
    todoLists.add(TodoList(key: UniqueKey(), name: name,));
  }
}
