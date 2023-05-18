import 'package:flutter/material.dart';

class StreamBuilderWidget<T> extends StatelessWidget {
  final T? initialData;
  final Stream<T>? stream;
  final Widget? nullWidget;
  final Widget Function(BuildContext context, T data) builder;

  const StreamBuilderWidget({
    Key? key,
    this.stream,
    this.nullWidget,
    this.initialData,
    required this.builder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: initialData,
      stream: stream,
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (data == null) {
          return nullWidget ?? Container();
        } else {
          return builder(context, data);
        }
      }
    );
  }
}
