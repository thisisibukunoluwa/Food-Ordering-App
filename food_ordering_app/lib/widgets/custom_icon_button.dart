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
      this.borderWidth = 0.0,
      this.borderColor = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.all(12.0), 
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(12.0), 
        ),
        child: Icon(
          icon,
          color: Colors.black, 
        ),
      ),
    );
  }
}

