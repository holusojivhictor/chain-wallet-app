import 'package:flutter/material.dart';

enum AccountType {
  master(Colors.greenAccent),
  agent(Colors.orangeAccent);

  final Color dot;
  const AccountType(this.dot);
}
