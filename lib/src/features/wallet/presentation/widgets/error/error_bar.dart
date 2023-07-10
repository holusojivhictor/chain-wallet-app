import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:flutter/material.dart';

enum Level {
  warning,
  error,
}

class ErrorBar extends StatelessWidget {
  const ErrorBar({
    required this.errorText,
    required this.level,
    super.key,
  });

  final String errorText;
  final Level level;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      padding: Styles.edgeInsetAll10,
      decoration: BoxDecoration(
        color: level == Level.warning
            ? const Color(0xFFFEFBEC)
            : const Color(0xFFFBEBEC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: level == Level.warning
              ? const Color(0xFFEDA56B)
              : const Color(0xFFB5404D),
        ),
      ),
      child: Row(
        children: [
          const Text('❕'),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              errorText,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
