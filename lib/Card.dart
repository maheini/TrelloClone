import 'package:flutter/material.dart';

class Card extends StatefulWidget {
  Card(String? text, {VoidCallback? onChanged, Key? key}) : super(key: key);
  String? text;

  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<Card> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = widget.text?? '';
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: TextField(
        controller: controller,
      ),
    );
  }
}
