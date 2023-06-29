import 'package:flutter/material.dart';

enum AccountType {
  master(Color(0xFF29B6AF)),
  agent(Colors.orangeAccent);

  const AccountType(this.dot);

  final Color dot;
}
