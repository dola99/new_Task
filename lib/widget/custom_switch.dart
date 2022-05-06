import 'package:flutter/cupertino.dart';

class ToggoleWithText extends StatefulWidget {
  final String text;

  bool isSelect;
  dynamic Function(bool) onChanged;

  ToggoleWithText(
      {Key? key, required this.text, required this.isSelect, required this.onChanged}) : super(key: key);

  @override
  _ToggoleWithTextState createState() => _ToggoleWithTextState();
}

class _ToggoleWithTextState extends State<ToggoleWithText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          Transform.scale(
            scale: 1,
            child: CupertinoSwitch(
              onChanged: widget.onChanged,
              value: widget.isSelect,
              activeColor:const  Color.fromRGBO(0, 214, 91, 1),
            ),
          ),
        ],
      ),
    );
  }
}
