import 'package:flutter/widgets.dart';

class ViewModelProvider<T> extends InheritedWidget {
  ViewModelProvider({required this.viewModel, required this.child}) : super(child: child);

  final T viewModel;
  final Widget child;

  static ViewModelProvider<T>? of<T>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}
