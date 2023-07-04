import 'package:chain_wallet_mobile/src/features/common/presentation/dialogs/dialogs.dart';
import 'package:flutter/material.dart';

extension StateExtensions on State {
  void loading() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Loading();
      },
    );
  }
}
