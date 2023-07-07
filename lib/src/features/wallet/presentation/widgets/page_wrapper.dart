import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/app_bar/action_app_bar.dart';
import 'package:flutter/material.dart';

typedef OnPressed = void Function()?;

class PageWrapper extends StatelessWidget {
  const PageWrapper({
    required this.type,
    required this.title,
    required this.buttonText,
    required this.body,
    super.key,
    this.gestureOn = false,
    this.leading = true,
    this.enabled = false,
    this.onPressed,
  });

  final ChainType type;
  final String title;
  final String buttonText;
  final Widget body;
  final OnPressed onPressed;
  final bool gestureOn;
  final bool leading;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scaffold = Scaffold(
      appBar: ActionAppBar(
        hasLeading: leading,
        title: title,
        type: type,
        theme: theme,
      ),
      body: body,
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: Styles.edgeInsetAll10,
            color: theme.scaffoldBackgroundColor,
            child: PrimaryButton(
              text: buttonText,
              enabled: enabled,
              onPressed: onPressed,
            ),
          ),
        ],
      ),
    );

    if (gestureOn) {
      return WillPopScope(
        onWillPop: () async => false,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: scaffold,
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async => false,
      child: scaffold,
    );
  }
}
