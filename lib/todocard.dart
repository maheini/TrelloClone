import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  TodoCard({String? this.text, VoidCallback? onChanged, Key? key}) : super(key: key);
  String? text;


  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  TextEditingController controller = TextEditingController();
  BoxDecoration _textDecoration = BoxDecoration(
    color: Colors.black.withOpacity(0.15),
    borderRadius: const BorderRadius.all(Radius.circular(2)),
  );
  FocusNode focusNode = FocusNode();


  @override
  void initState() {
    controller.text = widget.text?? '';
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
    return Draggable(
      data: widget,
      feedback: Container(
        height: 40,
        width: 350,
        margin: const EdgeInsets.all(5),
        decoration: _textDecoration,
        padding: const EdgeInsets.all(5),
      ),
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: _textDecoration,
        padding: const EdgeInsets.all(5),
        child: TextField(
          focusNode: focusNode,
          decoration: const InputDecoration(border: InputBorder.none),
          controller: controller,
        ),
      ),
    );
  }
}
