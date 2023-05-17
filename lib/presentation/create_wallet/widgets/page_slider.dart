import 'package:chain_wallet_mobile/domain/app_constants.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:flutter/material.dart';

class PageSlider extends StatelessWidget {
  final Color? color;
  final int stop;
  final int length;

  const PageSlider({
    Key? key,
    required this.stop,
    required this.length,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 20;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 5,
                color: AppColors.grey4,
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: color ?? AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                height: 5,
                width: width * (stop / length),
                duration: kAnimationDuration,
              ),
              const Positioned(
                left: -5,
                top: -8,
                child: _Indicator(
                  active: true,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: -8,
                child: Center(
                  child: _Indicator(
                    active: stop >= length / 2,
                  ),
                ),
              ),
              Positioned(
                right: -5,
                top: -8,
                child: _Indicator(
                  active: stop == length,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({Key? key, required this.active}) : super(key: key);
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: active ? AppColors.primary : AppColors.grey4,
        shape: BoxShape.circle
      ),
    );
  }
}
