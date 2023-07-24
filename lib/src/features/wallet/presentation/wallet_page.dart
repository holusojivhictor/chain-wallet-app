import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/dialogs/transaction_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/app_bar/account_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/lists/tokens_list.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/views/top_view.dart';
import 'package:chain_wallet_mobile/src/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  late final TabController tabController;

  static const int tabLength = 2;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabLength, vsync: this);
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
    return BlocPresentationListener<WalletBloc>(
      listener: (_, event) {
        if (event is TransactionEmitted) {
          final fToast = ToastUtils.of(context);
          ToastUtils.showCustomToast(
            fToast,
            const TransactionBar(completed: true),
            gravity: ToastGravity.SNACKBAR,
          );
        }
      },
      child: ResponsiveBuilder(
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
          body: BlocBuilder<WalletBloc, WalletState>(
            builder: (ctx, state) => CustomScrollView(
              physics: const NeverScrollableScrollPhysics(),
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: PersistedTopView(
                    elevation: 0,
                    wallet: state.activeWallet,
                    chain: state.currentChain,
                    forceElevated: false,
                    tabController: tabController,
                    expandedHeight: 250,
                    collapsedHeight: 250,
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      TokensList(
                        tokens: state.tokensByChain[state.currentChain]!,
                        tickerById: state.tickerById,
                        chain: state.currentChain,
                      ),
                      TokensList(
                        tokens: state.tokensByChain[state.currentChain]!,
                        tickerById: state.tickerById,
                        chain: state.currentChain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
