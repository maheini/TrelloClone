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
  final BoxDecoration _textDecoration = BoxDecoration(
    color: Colors.black.withOpacity(0.15),
    borderRadius: const BorderRadius.all(Radius.circular(2)),
  );
  FocusNode focusNode = FocusNode();

  bool lock = true;


  @override
  void initState() {
    widget.controller.text = widget.text?? '';
    focusNode.addListener(() {
      if(!focusNode.hasPrimaryFocus && !lock) {
        setState(() {
          lock = true;
        });
      }
    });

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
        child: InkWell(
          onTap: () {
            if(lock){
              setState(() {lock = false;});
            }
          },
          child: IgnorePointer(
            ignoring: lock,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: _textDecoration,
              padding: const EdgeInsets.all(5),
              child: TextField(
                autofocus: true,
                focusNode: focusNode,
                decoration: const InputDecoration(border: InputBorder.none),
                controller: widget.controller,
              ),
            ),
          )
        ),
      ),
    );
  }
}
