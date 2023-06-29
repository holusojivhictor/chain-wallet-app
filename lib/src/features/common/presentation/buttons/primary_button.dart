import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.onPressed,
    super.key,
    this.text = '',
    this.isPrimary = true,
    this.backgroundColor,
    this.contentPadding,
    this.padding =
        const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
    this.borderRadius = 30,
    this.hasLoading = false,
    this.enabled = true,
    this.textStyle,
    this.textColor,
    this.child,
    this.side,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? contentPadding;
  final double borderRadius;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? textColor;
  final BorderSide? side;
  final Widget? child;
  final bool hasLoading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final style = textTheme.bodyMedium!.copyWith(
      fontWeight: FontWeight.w600,
    );

    final primaryTextColor = isPrimary ? AppColors.white : AppColors.primary;
    final primaryBgColor = isPrimary ? AppColors.primary : Colors.transparent;
    final enabledTextColor =
        enabled ? primaryTextColor : AppColors.white.withOpacity(0.7);

    final textChild = Text(
      text,
      style: textStyle ?? style.copyWith(color: textColor ?? enabledTextColor),
    );

    final primaryBorder = isPrimary
        ? BorderSide.none
        : const BorderSide(color: AppColors.primary, width: 1.5);

    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: backgroundColor != null
              ? MaterialStateProperty.all(backgroundColor)
              : MaterialStateProperty.all(
                  enabled ? primaryBgColor : AppColors.primary.withOpacity(0.7),
                ),
          shape: MaterialStateProperty.all(
            StadiumBorder(
              side: side ?? primaryBorder,
            ),
          ),
          padding: MaterialStateProperty.all(
            hasLoading
                ? Styles.inactiveButtonPadding
                : contentPadding ?? Styles.edgeInsetAll16,
          ),
        ),
        onPressed: hasLoading || !enabled ? null : onPressed,
        child: hasLoading ? const _LoadingIndicator() : child ?? textChild,
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        strokeWidth: 1.5,
        color: AppColors.white,
      ),
    );
  }
}
