import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.borderRadius,
      required this.widget,
      required this.color,
      this.onTap})
      : super(key: key);
  final double height;
  final double width;
  final double borderRadius;
  final Color color;
  final Widget widget;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: widget,
      ),
    );
  }
}
