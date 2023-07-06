import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ActionTile extends StatefulWidget {
  const ActionTile({super.key});

  @override
  State<ActionTile> createState() => _ActionTileState();
}

class _ActionTileState extends State<ActionTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        for (final type in ActionType.values)
          ActionButton(
            key: ValueKey<ActionType>(type),
            type: type,
            onActionTapped: onActionTapped,
          ),
      ],
    );
  }

  void onActionTapped(ActionType type) {
    HapticFeedback.selectionClick();
    if (type == ActionType.send) {
      context.go(AppRoute.send.path);
    }
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    required this.type,
    required this.onActionTapped,
    super.key,
  });

  final ActionType type;
  final ValueChanged<ActionType> onActionTapped;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 10,
      ),
      child: Column(
        children: [
          Material(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: InkWell(
              onTap: () => onActionTapped(type),
              borderRadius: BorderRadius.circular(30),
              splashColor: AppColors.grey6,
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.grey4,
                  child: type.icon,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            type.label,
            style: textTheme.bodyMedium!.copyWith(
              fontSize: 13,
              letterSpacing: 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
