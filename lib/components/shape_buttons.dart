import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ShapeButton extends StatelessWidget {
  final String shape;
  final VoidCallback onClick;

  const ShapeButton({Key? key, required this.shape, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      icon: SvgPicture.asset( // Widget to convert svg assets into icons.
        shape,
        color: Colors.white,
      ),
    );
  }
}