import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:flutter/material.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({super.key});

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

  void onActionTapped(ActionType type) {}
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
                  backgroundColor: AppColors.secondary.withOpacity(0.7),
                  child: Icon(type.icon, color: AppColors.grey8),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(type.label),
        ],
      ),
    );
  }
}
