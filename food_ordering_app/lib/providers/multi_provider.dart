// iterate through a list of providers and attacah them to the top of the widget tree

// we can also use remi rousselets' nested package

import 'package:flutter/material.dart';

class MultiProvider extends StatefulWidget {
  final List<SingleChildWidget> providers;
  final Widget child;

  const MultiProvider(
      {required this.providers, required this.child, super.key});

  @override
  State<MultiProvider> createState() => _MultiProviderState();
}

class _MultiProviderState extends State<MultiProvider> {
  late List<SingleChildWidget> _providers;

  @override
  void initState() {
    super.initState();
    _providers = widget.providers;
  }

  @override
  Widget build(BuildContext context) {
    Widget currentChild = widget.child;

    for (int i = _providers.length - 1; i >= 0; i--) {
      currentChild = _providers[i].createWidget(currentChild, context);
    }
    return currentChild;
  }
}

abstract class SingleChildWidget {
  Widget createWidget(Widget child, BuildContext context);
}


