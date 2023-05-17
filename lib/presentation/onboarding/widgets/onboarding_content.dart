import 'package:chain_wallet_mobile/presentation/padded_text.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final String header;
  final String subtitle;
  final String image;

  const OnboardingContent({
    Key? key,
    required this.header,
    required this.subtitle,
    required this.image,
  }) : super(key: key);

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
