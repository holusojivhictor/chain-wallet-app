import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CommonButtonBar extends StatelessWidget {
  const CommonButtonBar({
    required this.children,
    super.key,
    this.alignment = WrapAlignment.end,
    this.margin = Styles.edgeInsetVertical5,
    this.runSpacing,
    this.spacing = 10,
  });

  final List<Widget> children;
  final WrapAlignment alignment;
  final EdgeInsets margin;
  final double? runSpacing;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final forEndDrawer = getDeviceType(size) != DeviceScreenType.mobile;

    return Container(
      margin: margin,
      child: Wrap(
        alignment: alignment,
        spacing: spacing,
        runSpacing: runSpacing != null
            ? runSpacing!
            : forEndDrawer
                ? 10
                : 0,
        children: children,
      ),
    );
  }
}
