import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/images/svg_image.dart';
import 'package:flutter/material.dart';

class AppSvgs {
  const AppSvgs._();

  static SvgAsset iconCheck = SvgAsset(
    image: Assets.getSvgPath('icon_check.svg'),
    color: Colors.white,
  );

  static SvgAsset send = SvgAsset(image: Assets.getSvgPath('send.svg'));

  static SvgAsset card = SvgAsset(image: Assets.getSvgPath('card.svg'));

  static SvgAsset ethereum = SvgAsset(image: Assets.getSvgPath('ethereum.svg'));
}
