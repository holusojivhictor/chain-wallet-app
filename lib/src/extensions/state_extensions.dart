import 'package:chain_wallet_mobile/src/features/common/presentation/dialogs/dialogs.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/dialog/preference_dialog.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/popup/popup.dart';
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

  Future<T?> showPopup<T>({
    required List<PopupEntry<T>> items,
    required String title,
    T? initialValue,
    double? elevation,
    String? semanticLabel,
    bool useRootNavigator = true,
  }) {
    assert(items.isNotEmpty, 'Invalid length');
    assert(
      debugCheckHasMaterialLocalizations(context),
      'No MaterialLocalizations found.',
    );

    switch (Theme.of(context).platform) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        break;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        semanticLabel ??= MaterialLocalizations.of(context).popupMenuLabel;
    }

    return showDialog<T>(
      context: context,
      barrierLabel: semanticLabel,
      useRootNavigator: useRootNavigator,
      builder: (BuildContext context) {
        return PreferenceDialog<T>(
          elevation: elevation,
          title: title,
          items: items,
        );
      },
    );
  }
}
