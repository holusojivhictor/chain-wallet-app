import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/popup/popup.dart';
import 'package:flutter/material.dart';

const double _kElevation = 8;

typedef PopupItemSelected<T> = void Function(T value);

typedef PopupCanceled = void Function();

typedef PopupItemBuilder<T> = List<PopupEntry<T>> Function(
  BuildContext context,
);

class PopupButton<T> extends StatefulWidget {
  const PopupButton({
    required this.itemBuilder,
    required this.title,
    super.key,
    this.initialValue,
    this.onOpened,
    this.onSelected,
    this.onCanceled,
    this.tooltip,
    this.elevation,
    this.child,
    this.padding = const EdgeInsets.all(8),
    this.enabled = true,
    this.enableFeedback,
  });

  final PopupItemBuilder<T> itemBuilder;
  final T? initialValue;
  final VoidCallback? onOpened;
  final PopupItemSelected<T>? onSelected;
  final PopupCanceled? onCanceled;
  final String title;
  final String? tooltip;
  final double? elevation;
  final EdgeInsetsGeometry padding;
  final Widget? child;
  final bool enabled;
  final bool? enableFeedback;

  @override
  PopupButtonState<T> createState() => PopupButtonState();
}

class PopupButtonState<T> extends State<PopupButton<T>> {
  void showButtonDialog() {
    final items = widget.itemBuilder(context);

    if (items.isNotEmpty) {
      widget.onOpened?.call();
      showPopup<T?>(
        elevation: widget.elevation ?? _kElevation,
        items: items,
        title: widget.title,
        initialValue: widget.initialValue,
      ).then<void>((T? newValue) {
        if (!mounted) {
          return null;
        }
        if (newValue == null) {
          widget.onCanceled?.call();
          return null;
        }
        widget.onSelected?.call(newValue);
      });
    }
  }

  bool get _canRequestFocus {
    final mode =
        MediaQuery.maybeNavigationModeOf(context) ?? NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return widget.enabled;
      case NavigationMode.directional:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final enableFeedback = widget.enableFeedback ??
        PopupMenuTheme.of(context).enableFeedback ??
        true;

    assert(
      debugCheckHasMaterialLocalizations(context),
      'No MaterialLocalizations found.',
    );

    final localizations = MaterialLocalizations.of(context);
    if (widget.child != null) {
      return Tooltip(
        message: widget.tooltip ?? localizations.showMenuTooltip,
        child: InkWell(
          onTap: widget.enabled ? showButtonDialog : null,
          canRequestFocus: _canRequestFocus,
          enableFeedback: enableFeedback,
          child: widget.child,
        ),
      );
    }

    return IconButton(
      icon: Icon(Icons.adaptive.more),
      padding: widget.padding,
      tooltip: widget.tooltip ?? MaterialLocalizations.of(context).showMenuTooltip,
      onPressed: widget.enabled ? showButtonDialog : null,
      enableFeedback: enableFeedback,
    );
  }
}
