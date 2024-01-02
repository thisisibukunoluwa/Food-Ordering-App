import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../services/navigation_service.dart';

class NavBackButton extends StatelessWidget {
  final Color color;
  const NavBackButton({super.key, required this.color});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
          width: 50.0,
          height: 50.0,
          decoration:  BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
          ),
          child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                navigationService.navigateBack();
              })
            ),
    );
  }
}