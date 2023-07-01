import 'package:flutter/material.dart';

enum AccountType {
  master,
  agent;

  Color get dot {
    switch (this) {
      case master:
        return const Color(0xFF29B6AF);
      case agent:
        return Colors.orangeAccent;
    }
  }
}
