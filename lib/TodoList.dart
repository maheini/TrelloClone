import 'package:flutter/material.dart';
import 'package:trelloclone/todocard.dart';

class TodoList extends StatefulWidget {
  TodoList({String? this.name, Key? key, VoidCallback? onItemChange}) : super(key: key);
  String? name;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  void cardChanged(){
    print('Eine Karte hat sich geändert...');

  }

  List<Widget> _cards = [TodoCard(text: 'text',), TodoCard(text: 'text2',)];
  TextEditingController controller = TextEditingController();



  @override
  void initState() {
    controller.text = widget.name?? '';
    print(widget.name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              Column(
                children: _cards,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
