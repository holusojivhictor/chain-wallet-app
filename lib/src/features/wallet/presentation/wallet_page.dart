import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/account_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ResponsiveBuilder(
      builder: (ctx, size) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size(0, 60),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.paddingOf(context).top - 8,
              ),
              const AccountBar(),
            ],
          ),
        ),
        body: BlocBuilder<WalletBloc, WalletState>(
          builder: (_, state) => ListView(
            children: <Widget>[
              ...state.tickers.map((e) {
                return <Widget>[
                  ListTile(
                    title: Text(
                      e.productId ?? 'Demo',
                    ),
                    subtitle: Text(
                      '${e.price}',
                    ),
                  )
                ];
              }).expand((List<Widget> element) => element),
            ],
          ),
        ),
      ),
    );
  }
}
