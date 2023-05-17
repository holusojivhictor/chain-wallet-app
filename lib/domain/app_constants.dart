import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:flutter/widgets.dart';

const double kPadding = 10.0;
const Duration kAnimationDuration = Duration(milliseconds: 300);
const Curve kCurve = Curves.easeInOut;

/// Languages map
const languagesMap = {
  AppLanguageType.english: LanguageModel('en', 'US'),
};

/// Basic slide transition
SlideTransition basicSlide(Widget child, Animation<double> animation) {
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(animation),
    child: child,
  );
}
