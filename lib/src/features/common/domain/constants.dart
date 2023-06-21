import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:flutter/widgets.dart';

const double kPadding = 10;

/// Languages map
const languagesMap = {
  AppLanguageType.english: Language('en', 'US'),
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
