// Generic Interface for all BLoCs
import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

// Generic BLoC provider
class CustomBlocProvider<T extends BlocBase> extends StatefulWidget {
  CustomBlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }) : super(key: key);

  final T bloc;
  final Widget child;

  @override
  _CustomBlocProviderState<T> createState() => _CustomBlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context) {
    final type = _typeOf<CustomBlocProvider<T>>();
    CustomBlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _CustomBlocProviderState<T> extends State<CustomBlocProvider<BlocBase>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
