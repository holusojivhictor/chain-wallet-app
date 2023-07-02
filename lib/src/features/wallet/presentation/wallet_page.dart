import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/app_bar/account_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tab/tokens_view.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tiles/tiles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  bool _didChangeDependencies = false;
  late final TabController tabController;

  static const int tabLength = 2;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabLength, vsync: this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didChangeDependencies) return;
    _didChangeDependencies = true;
    context.read<WalletBloc>().add(const WalletEvent.loadBalance());
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ResponsiveBuilder(
      builder: (ctx, size) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size(0, 70),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.paddingOf(context).top,
              ),
              const AccountBar(),
            ],
          ),
        ),
        body: BlocConsumer<WalletBloc, WalletState>(
          listenWhen: (prev, curr) => prev.balanceStatus != curr.balanceStatus,
          listener: (_, state) {},
          builder: (ctx, state) => SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                AddressTile(address: state.activeWallet.shortAddress),
                const SizedBox(height: 10),
                BalanceTile(
                  balance: state.activeWallet.walletBalance,
                  nativeBalance: state.activeWallet.native,
                  chain: state.currentChain,
                ),
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
                const TokensMainView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
