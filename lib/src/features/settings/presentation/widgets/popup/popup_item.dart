import 'package:flutter/material.dart';

const double _kMenuHorizontalPadding = 16;

abstract class PopupEntry<T> extends StatefulWidget {
  const PopupEntry({super.key});

  double get height;

  bool represents(T? value);
}

class PopupItem<T> extends PopupEntry<T> {
  const PopupItem({
    required this.child,
    super.key,
    this.value,
    this.onTap,
    this.height = kMinInteractiveDimension,
    this.padding,
  });

  final T? value;

  final VoidCallback? onTap;

  @override
  final double height;

  final EdgeInsets? padding;

  final Widget? child;

  @override
  bool represents(T? value) => value == this.value;

  @override
  PopupItemState<T, PopupItem<T>> createState() =>
      PopupItemState<T, PopupItem<T>>();
}

class PopupItemState<T, W extends PopupItem<T>> extends State<W> {
  @protected
  Widget? buildChild() => widget.child;

  @protected
  void handleTap() {
    widget.onTap?.call();

    Navigator.pop<T>(context, widget.value);
  }

  @override
  Widget build(BuildContext context) {
    final Widget item = Container(
      alignment: AlignmentDirectional.centerStart,
      constraints: BoxConstraints(minHeight: widget.height),
      padding: widget.padding ??
          const EdgeInsets.symmetric(horizontal: _kMenuHorizontalPadding),
      child: buildChild(),
    );

    return MergeSemantics(
      child: Semantics(
        button: true,
        child: InkWell(
          onTap: handleTap,
          child: item,
        ),
      ),
    );
  }
}

class CheckedPopupItem<T> extends PopupItem<T> {
  const CheckedPopupItem({
    super.key,
    super.value,
    this.checked = false,
    super.padding,
    super.height,
    super.child,
  });

  final bool checked;

  @override
  PopupItemState<T, CheckedPopupItem<T>> createState() =>
      _CheckedPopupItemState<T>();
}

class _CheckedPopupItemState<T> extends PopupItemState<T, CheckedPopupItem<T>>
    with SingleTickerProviderStateMixin {
  static const Duration _fadeDuration = Duration(milliseconds: 150);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: _fadeDuration, vsync: this)
      ..value = widget.checked ? 1.0 : 0.0
      ..addListener(() => setState(() {}));
  }

  @override
  void handleTap() {
    if (widget.checked) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    super.handleTap();
  }

  @override
  Widget buildChild() {
    return IgnorePointer(
      child: ListTile(
        dense: true,
        title: widget.child,
        trailing: Icon(_controller.isDismissed ? null : Icons.done),
      ),
    );
  }
}
