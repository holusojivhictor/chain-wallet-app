import 'package:chain_wallet_mobile/src/features/common/presentation/text/padded_text.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    required this.header,
    required this.subtitle,
    required this.image,
    super.key,
  });

  final String header;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          header,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        PaddedText(
          text: subtitle,
          textStyle: textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Image.asset(image),
        const SizedBox(height: 10),
      ],
    );
  }
}
