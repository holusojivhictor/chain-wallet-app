import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/popup/item_popup_filter.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/tiles/app_bar.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/tiles/setting_button.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/tiles/setting_card.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/tiles/settings_radio_tile.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GeneralView extends StatefulWidget {
  const GeneralView({super.key});

  @override
  State<GeneralView> createState() => _GeneralViewState();
}

class _GeneralViewState extends State<GeneralView> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: BasicAppBar(
        title: s.general,
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (ctx, state) => Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SettingCard(
                  key: ValueKey<CurrencyType>(state.currency),
                  title: s.currencyConversion,
                  subtitle: s.currencyConversionDesc,
                  bottom: ItemPopupFilter<CurrencyType>(
                    title: s.currencyConversion,
                    selectedValue: state.currency,
                    values: CurrencyType.values,
                    itemText: (val, _) => val.translate,
                    onSelected: (newVal) {
                      add(SettingsEvent.currencyChanged(newValue: newVal));
                    },
                    child: SettingButton(hint: state.currency.translate),
                  ),
                ),
                SettingCard(
                  key: ValueKey<PrimaryCurrency>(state.primary),
                  title: s.primaryCurrency,
                  subtitle: s.primaryCurrencyDesc,
                  bottom: SettingsRadioTile<PrimaryCurrency>(
                    selectedValue: state.primary,
                    values: PrimaryCurrency.values,
                    itemText: (val, _) => val.translate,
                    onSelected: (val) {
                      add(SettingsEvent.primaryCurrencyChanged(newValue: val));
                    },
                  ),
                ),
                SettingCard(
                  key: ValueKey<AppLanguageType>(state.currentLanguage),
                  title: s.currentLanguage,
                  subtitle: s.currentLanguageDesc,
                  bottom: ItemPopupFilter<AppLanguageType>(
                    title: s.currentLanguage,
                    selectedValue: state.currentLanguage,
                    values: AppLanguageType.values,
                    itemText: (val, _) => val.translate,
                    onSelected: (newVal) {
                      add(SettingsEvent.languageChanged(newValue: newVal));
                    },
                    child: SettingButton(hint: state.currentLanguage.translate),
                  ),
                ),
                SettingCard(
                  key: ValueKey<AutoThemeModeType>(state.themeMode),
                  title: s.themeMode,
                  subtitle: s.themeModeDesc,
                  bottom: Align(
                    alignment: Alignment.centerLeft,
                    child: Switch(
                      value: state.themeMode.system,
                      onChanged: (val) => add(
                        SettingsEvent.autoThemeModeTypeChanged(
                          newValue: AutoThemeModeType.translate(value: val),
                        ),
                      ),
                    ),
                  ),
                ),
                if (state.themeMode == AutoThemeModeType.off)
                  SettingCard(
                    key: ValueKey<AppThemeType>(state.currentTheme),
                    title: s.themeType,
                    subtitle: s.themeTypeDesc,
                    bottom: SettingsRadioTile<AppThemeType>(
                      selectedValue: state.currentTheme,
                      values: AppThemeType.values,
                      itemText: (val, _) => val.translate,
                      onSelected: (val) {
                        add(SettingsEvent.themeChanged(newValue: val));
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void add(SettingsEvent event) => context.read<SettingsBloc>().add(event);
}
