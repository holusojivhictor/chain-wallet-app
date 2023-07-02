import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/images/svg_image.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
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
              vertical: 5,
              horizontal: 10,
            ),
            child: Text(
              address,
              style: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 12,
              ),
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
