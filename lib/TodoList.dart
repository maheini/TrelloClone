import 'package:flutter/material.dart';
import 'package:trelloclone/todocard.dart';

class TodoList extends StatefulWidget {
  TodoList({String? this.name, Key? key, VoidCallback? onItemChange}) : super(key: key);
  String? name;
  List<Widget> _cards = [];

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

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
          child: DragTarget(
            onAccept: (item) {
              if(item is TodoCard){
                setState(() {
                  widget._cards.add(item);
                });
              }},
            builder: (context, candidateItems, rejectedItems) {
              return Column(
                children: [
                  TextField(textAlign: TextAlign.center, controller: controller),
                  Column(
                    children: widget._cards,
                  ),
                  TextButton(
                    onPressed: () => setState(() {
                      widget._cards.add(TodoCard(key: UniqueKey(),text: 'NewCard'));
                    }),
                    child: Text('Eins hinzufügen...'),
                  ),
                ],
              );
            }
          ),
        ),
      ],
    );
  }
}
