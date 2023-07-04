import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DefaultTransitionPage<T> extends CustomTransitionPage<T> {
  const DefaultTransitionPage({
    required super.child,
    super.name,
    super.arguments,
    super.restorationId,
    super.key,
  }) : super(
          transitionsBuilder: _transitionsBuilder<T>,
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );

  static Widget _transitionsBuilder<T>(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return const ZoomPageTransitionsBuilder().buildTransitions<T>(
      null,
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
