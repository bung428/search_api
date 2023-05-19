import 'package:flutter/material.dart';
import 'package:search_api/src/widget/stream_builder_widget.dart';

class AppBarStream extends StatelessWidget implements PreferredSizeWidget {
  const AppBarStream({Key? key, required this.appbar, this.height = 56})
      : super(key: key);

  final StreamBuilderWidget appbar;
  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return appbar;
  }
}