import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  TodoCard({this.text = '', this.onDropped, Key? key}) : super(key: key);
  String text;

  final Function(TodoCard)? onDropped;

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  TextEditingController controller = TextEditingController();
  final BoxDecoration _textDecoration = BoxDecoration(
    color: Colors.black.withOpacity(0.15),
    borderRadius: const BorderRadius.all(Radius.circular(2)),
  );
  FocusNode focusNode = FocusNode();

  bool lockEditing = false;


  @override
  void initState() {
    controller.text = widget.text;
    focusNode.addListener(() {
      if(!focusNode.hasPrimaryFocus && !lockEditing) {
        widget.text = controller.text;
        setState(() {
          lockEditing = true;
        });
      }
    });

    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Draggable(
        onDragCompleted: () => widget.onDropped?.call(widget),
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
            if(lockEditing){
              setState(() {lockEditing = false;});
              FocusScope.of(context).requestFocus(focusNode);
            }
          },
          child: IgnorePointer(
            ignoring: lockEditing,
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: _textDecoration,
              padding: const EdgeInsets.all(5),
              child: TextField(
                keyboardType: TextInputType.text,
                maxLines: null,
                autofocus: true,
                controller: controller,
                focusNode: focusNode,
                onSubmitted: (text) {FocusScope.of(context).unfocus();},
                decoration: const InputDecoration(border: InputBorder.none),
              ),
            ),
          )
        ),
      ),
    );
  }
}
