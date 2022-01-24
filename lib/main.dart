import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:trelloclone/TodoList.dart';


void main() {
  runApp(const MaterialApp(home: MainScreen()));
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _todoLists = [];
  ScrollController scrollController = ScrollController();

  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TrelloClone'),
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
            child: SingleChildScrollView(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ..._todoLists,
                  _addListButton()
                ],
              ),
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {

        }),
        child: const Icon(Icons.loop),
      ),
    );
  }
  TextEditingController controller = TextEditingController();

  Widget _addListButton(){
    return Container(
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
            _addTodoList('', _todoLists);
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
    );
  }

  void _addTodoList(String name, List<Widget> todoLists)
    => todoLists.add(TodoList(name: name,));
}
