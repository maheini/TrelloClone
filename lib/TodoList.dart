import 'package:flutter/material.dart';
import 'package:trelloclone/todocard.dart';

class TodoList extends StatefulWidget {
  TodoList({this.name, Key? key, VoidCallback? onItemChange}) : super(key: key);
  String? name;
  List<Widget> _cards = [];

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList>{
  TextEditingController controller = TextEditingController();

  ScrollController scrollController = ScrollController();
  bool scrollToEnd = false;
  void scroll(){
    if(scrollToEnd){
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }

  @override
  void initState() {
    controller.text = widget.name?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => scroll());
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: 350,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey[400]!, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            autofocus: true,
            textAlign: TextAlign.center,
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  DragTarget<TodoCard>(
                    builder: (context, candidateItems, rejectedItems) {
                      return Column(
                        children: widget._cards,
                      );
                    },
                    onAccept: (item) {
                      widget._cards.add(item);
                    }
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    child: TextButton(
                      onPressed: () => setState(() {
                        widget._cards.add(TodoCard());
                        scrollToEnd = true;
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
                  ),
                ]
              ),
            ),
          ),
        ],
      )
    );
  }
}
