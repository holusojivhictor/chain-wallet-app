import 'package:flutter/material.dart';

class ShortAddress extends StatelessWidget {
  const ShortAddress({
    required this.address,
    super.key,
    this.style,
  });

  final String address;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        style: style ?? textTheme.bodyMedium!.copyWith(
          fontSize: 12,
        ),
        children: <TextSpan>[
          TextSpan(
            text: address.substring(0, address.length ~/ 4),
          ),
          const TextSpan(text: '...'),
          TextSpan(
            text: address.substring(address.length - 4),
          ),
        ],
      ),
      textScaleFactor: MediaQuery.textScaleFactorOf(context),
    );
  }
}
