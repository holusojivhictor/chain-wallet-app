import 'package:chain_wallet_mobile/src/features/common/domain/app_svgs.dart';
import 'package:flutter/material.dart';

enum ActionType {
  send,
  receive,
  swap;

  Widget get icon {
    switch(this) {
      case ActionType.send:
        return AppSvgs.send;
      case ActionType.receive:
        return AppSvgs.card;
      case ActionType.swap:
        return AppSvgs.ethereum;
    }
  }

  String get label {
    switch(this) {
      case ActionType.send:
        return 'Send';
      case ActionType.receive:
        return 'Receive';
      case ActionType.swap:
        return 'Swap';
    }
  }
}
