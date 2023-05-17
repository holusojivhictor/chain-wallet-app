import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'widgets/account_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
      builder: (ctx, size) => Scaffold(
        body: SafeArea(
          child: Column(
            children: const [
              AccountBar(),
            ],
          ),
        ),
      ),
    );
  }
}
