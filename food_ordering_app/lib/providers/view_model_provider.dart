import 'package:flutter/widgets.dart';

class ViewModelProvider<T> extends InheritedWidget {
  const ViewModelProvider({
    Key? key,
    required this.viewModel,
    required this.child,
  }) : super(child: child, key: key);

  final T viewModel;
  final Widget child;

  static ViewModelProvider<T>? of<T>(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ViewModelProvider<T>>();
  }

  @override
  bool updateShouldNotify(ViewModelProvider<T> oldWidget) =>
      viewModel != oldWidget.viewModel;

  static T read<T>(BuildContext context) {
    final viewModelProvider = of<T>(context);

    if (viewModelProvider == null) {
      throw FlutterError('ViewModelProvider<$T> not found in context');
    }

    return viewModelProvider.viewModel;
  }
}



