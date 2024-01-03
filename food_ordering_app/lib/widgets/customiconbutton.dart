import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback? onPressed;
  final double borderWidth;
  final Color borderColor;

  const CustomIconButton(
      {Key? key,
      required this.color,
      required this.icon,
      this.onPressed,
      this.borderWidth = 0.0, // Default border width is 0.0 (no border)
      this.borderColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color,
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: IconButton(
        icon: Icon(icon,
          color: Colors.black,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

// Example of using the Custom


