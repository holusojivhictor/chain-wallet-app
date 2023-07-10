import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    required this.title,
    required this.subtitle,
    required this.bottom,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: textTheme.titleLarge!.copyWith(
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            subtitle,
            style: textTheme.bodySmall!.copyWith(fontSize: 13),
          ),
          const SizedBox(height: 15),
          bottom,
        ],
      ),
    );
  }
}
