import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  TodoCard({this.text, this.onChanged, Key? key}) : super(key: key);
  String? text;
  TextEditingController controller = TextEditingController();

  final VoidCallback? onChanged;


  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  BoxDecoration _textDecoration = BoxDecoration(
    color: Colors.black.withOpacity(0.15),
    borderRadius: const BorderRadius.all(Radius.circular(2)),
  );
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    widget.controller.text = widget.text?? '';
    focusNode.addListener(() => setState(() {
      if(focusNode.hasFocus){
        _textDecoration = BoxDecoration(
          color: Colors.black.withOpacity(0.15),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        );
      }
      else{
        _textDecoration = BoxDecoration(
          color: Colors.black.withOpacity(0.25),
          borderRadius: const BorderRadius.all(Radius.circular(2)),
        );
      }
    }));
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Draggable(
        onDragCompleted: widget.onChanged,
        feedback: Container (
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.black.withOpacity(0.4),
          ),
          width: constraints.maxWidth,
          height: 50,
        ),
        data: widget,
        child: Container(
          margin: const EdgeInsets.all(5),
          decoration: _textDecoration,
          padding: const EdgeInsets.all(5),
          child: TextField(
            focusNode: focusNode,
            decoration: const InputDecoration(border: InputBorder.none),
            controller: widget.controller,
          ),
        ),
      ),
    );
  }
}
