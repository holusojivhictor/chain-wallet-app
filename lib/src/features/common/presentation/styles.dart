import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:flutter/material.dart';

class Styles {
  const Styles._();

  static const edgeInsetAll16 = EdgeInsets.all(16);
  static const edgeInsetAll10 = EdgeInsets.all(10);
  static const edgeInsetAll7 = EdgeInsets.all(7);
  static const edgeInsetAll5 = EdgeInsets.all(5);
  static const edgeInsetAll3 = EdgeInsets.all(3);
  static const edgeInsetAll0 = EdgeInsets.zero;
  static const edgeInsetHorizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const edgeInsetVertical16 = EdgeInsets.symmetric(vertical: 16);
  static const edgeInsetHorizontal5 = EdgeInsets.symmetric(horizontal: 5);
  static const edgeInsetVertical5 = EdgeInsets.symmetric(vertical: 5);
  static const edgeInsetHorizontal10 = EdgeInsets.symmetric(horizontal: 10);
  static const edgeInsetVertical10 = EdgeInsets.symmetric(vertical: 10);

  static const inactiveButtonPadding = EdgeInsets.symmetric(vertical: 14);

  static const formFieldMargin = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 10,
  );

  static const formFieldPadding = EdgeInsets.symmetric(horizontal: 12, vertical: 18);

  static BoxDecoration barDecoration = BoxDecoration(
    border: Border.all(width: 1.5, color: AppColors.grey5),
    borderRadius: Styles.defaultBorderRadius,
  );

  static const formFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.grey5, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  static const focusedFormFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.primary, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  static const navBorder = Border(
    top: BorderSide(color: AppColors.grey3),
  );

  static const chipCircularRadius = Radius.circular(8);

  static const chipBorderRadius = BorderRadius.all(chipCircularRadius);

  static const alertButtonBorderSide = BorderSide(color: AppColors.error);

  static const defaultBorderRadius = BorderRadius.all(Radius.circular(10));

  static const alertDialogShape = RoundedRectangleBorder(borderRadius: defaultBorderRadius);

  static const chipShape = RoundedRectangleBorder(borderRadius: chipBorderRadius);
}
