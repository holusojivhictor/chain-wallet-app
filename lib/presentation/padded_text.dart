import 'package:chain_wallet_mobile/presentation/styles.dart';
import 'package:flutter/material.dart';

class PaddedText extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final String? text;
  final TextAlign? textAlign;
  final TextStyle? textStyle;

  const PaddedText({Key? key, this.padding, this.text, this.textStyle, this.textAlign}) : super(key: key);

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
