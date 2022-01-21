import 'package:flutter/material.dart';
import 'package:trelloclone/todocard.dart';

class TodoList extends StatefulWidget {
  TodoList({String? this.name, Key? key, VoidCallback? onItemChange}) : super(key: key);
  String? name;
  List<Widget> _cards = [];

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{

  TextEditingController controller = TextEditingController();



  @override
  void initState() {
    controller.text = widget.name?? '';
    super.initState();
    print('state wird erstellt');
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
                  // widget._cards.add(item);
                });
              }},
            builder: (context, candidateItems, rejectedItems) {
              return Column(
                children: [
                  TextField(autofocus: true, textAlign: TextAlign.center, controller: controller),
                  Column(
                    children: widget._cards,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () => setState(() {
                        widget._cards.add(TodoCard(key: UniqueKey(),text: 'NewCard'));
                      }),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.05)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.add),
                          Container(width: 10,),
                          const Text('add card'),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          ),
        ),
      ],
    );
  }
}
