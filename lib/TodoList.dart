import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList(this.name,{Key? key, VoidCallback? onItemChange}) : super(key: key);
  String? name;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Widget> _cards = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.name?? '';
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
