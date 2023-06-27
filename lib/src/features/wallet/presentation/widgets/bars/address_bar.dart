import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/images/svg_image.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressBar extends StatelessWidget {
  const AddressBar({
    required this.address,
    super.key,
  });

  final String address;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Material(
        color: const Color(0xFFB7DFB2),
        borderRadius: BorderRadius.circular(15),
        child: InkWell(
          onTap: () async {
            final fToast = ToastUtils.of(context);
            await FlutterClipboard.copy(address).whenComplete(() {
              HapticFeedback.selectionClick();
              ToastUtils.showCustomToast(fToast, buildToast(context));
            });
          },
          borderRadius: BorderRadius.circular(15),
          splashColor: theme.colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            child: Text.rich(
              TextSpan(
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontSize: 13,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: address.substring(0, address.length ~/ 4),
                  ),
                  const TextSpan(text: '...'),
                  TextSpan(
                    text: address.substring(address.length - 4),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
              textScaleFactor: MediaQuery.textScaleFactorOf(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildToast(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: MediaQuery.sizeOf(context).width / 2.5,
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.grey8.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: SvgAsset(
              image: Assets.getSvgPath('icon_check.svg'),
              color: Colors.white,
            ),
          ),
          Text(
            s.copiedToClipboard,
            style: textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
