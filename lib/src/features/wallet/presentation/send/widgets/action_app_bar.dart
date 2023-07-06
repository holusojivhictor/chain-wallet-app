import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

const double _kLeadingWidth = 65;

class ActionAppBar extends AppBar {
  ActionAppBar({
    required String title,
    required ChainType type,
    required ThemeData theme,
    super.key,
    this.hasLeading = false,
  }) : super(
          centerTitle: true,
          leadingWidth: _kLeadingWidth,
          scrolledUnderElevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          automaticallyImplyLeading: false,
          leading: hasLeading ? const _Leading() : null,
          title: _Title(title: title, type: type),
          actions: [
            const _Trailing(),
          ],
        );

  final bool hasLeading;
}

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
    required this.type,
  });

  final String title;
  final ChainType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          title,
          style: theme.textTheme.titleLarge!.copyWith(
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 3),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 3,
              backgroundColor: type.bgColor,
            ),
            const SizedBox(width: 3),
            Text(
              type.label,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _Leading extends StatelessWidget {
  const _Leading();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return _Button(
      text: s.back,
      trailing: false,
      onPressed: () => Navigator.pop(context),
    );
  }
}

class _Trailing extends StatelessWidget {
  const _Trailing();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return _Button(
      text: s.cancel,
      trailing: true,
      onPressed: () {
        context.go(AppRoute.home.path);
        context.read<SendCubit>().reset();
      },
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.text,
    required this.trailing,
    required this.onPressed,
  });

  final String text;
  final bool trailing;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final child = TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(letterSpacing: 0.3),
      ),
    );

    if (trailing) {
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: child,
      );
    }
    return child;
  }
}
