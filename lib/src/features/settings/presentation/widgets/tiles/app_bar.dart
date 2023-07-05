import 'package:flutter/material.dart';

class BasicAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BasicAppBar({required this.title, super.key});

  final String title;

  @override
  State<BasicAppBar> createState() => _BasicAppBarState();

  @override
  Size get preferredSize => _PreferredAppBarSize(kToolbarHeight, null);
}

class _BasicAppBarState extends State<BasicAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

class _PreferredAppBarSize extends Size {
  _PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
          (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0),
        );

  final double? toolbarHeight;
  final double? bottomHeight;
}
