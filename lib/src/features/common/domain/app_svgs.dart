import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/images/svg_image.dart';

class AppSvgs {
  const AppSvgs._();

  static SvgAsset floral = SvgAsset(image: Assets.getSvgPath('floral.svg'));

  static SvgAsset iconCheck = SvgAsset(image: Assets.getSvgPath('icon_check.svg'));

  static SvgAsset send = SvgAsset(image: Assets.getSvgPath('send.svg'));

  static SvgAsset card = SvgAsset(image: Assets.getSvgPath('card.svg'));

  static SvgAsset ethereum = SvgAsset(image: Assets.getSvgPath('ethereum.svg'));
}
