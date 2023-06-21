import 'package:chain_wallet_mobile/src/features/home/presentation/widgets/account_bar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ResponsiveBuilder(
      builder: (ctx, size) => const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AccountBar(),
            ],
          ),
        ),
      ),
    );
  }
}
