import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  const PaddedText({
    super.key,
    this.padding,
    this.text,
    this.textStyle,
    this.textAlign,
  });

  final EdgeInsetsGeometry? padding;
  final String? text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: padding ?? Styles.edgeInsetHorizontal10,
      child: Text(
        text ?? '',
        textAlign: textAlign,
        style: textStyle ?? theme.textTheme.headlineSmall,
      ),
    );
  }
}
