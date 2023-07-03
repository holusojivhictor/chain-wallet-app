import 'package:flutter/material.dart';

enum ActionType {
  send,
  receive,
  swap;

  IconData get icon {
    switch(this) {
      case ActionType.send:
        return Icons.eco_outlined;
      case ActionType.receive:
        return Icons.wallet;
      case ActionType.swap:
        return Icons.icecream_outlined;
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
