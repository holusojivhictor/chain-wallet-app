import 'package:flutter/material.dart';

class HeaderColumn extends StatelessWidget {
  const HeaderColumn({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          title,
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            letterSpacing: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge!.copyWith(fontSize: 15),
          ),
        ),
      ],
    );
  }
}
