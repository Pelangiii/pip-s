import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';

class ColorPicker extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const ColorPicker({super.key, required this.color, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      // untuk color picker
      margin: EdgeInsets.only(
        top: defaultPadding,
        right: defaultPadding
      ),
      padding: EdgeInsets.all(2.5),
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        )
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}