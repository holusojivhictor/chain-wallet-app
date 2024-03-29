// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Chain Wallet`
  String get appName {
    return Intl.message(
      'Chain Wallet',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Hide`
  String get hide {
    return Intl.message(
      'Hide',
      name: 'hide',
      desc: '',
      args: [],
    );
  }

  /// `Show`
  String get show {
    return Intl.message(
      'Show',
      name: 'show',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message(
      'View',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get to {
    return Intl.message(
      'To',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Go Home`
  String get goHome {
    return Intl.message(
      'Go Home',
      name: 'goHome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Chain Wallet`
  String get welcomeToChainWallet {
    return Intl.message(
      'Welcome to Chain Wallet',
      name: 'welcomeToChainWallet',
      desc: '',
      args: [],
    );
  }

  /// `Move your assets around incognito`
  String get incognitoAssets {
    return Intl.message(
      'Move your assets around incognito',
      name: 'incognitoAssets',
      desc: '',
      args: [],
    );
  }

  /// `Complete control over your portfolio`
  String get portfolioControl {
    return Intl.message(
      'Complete control over your portfolio',
      name: 'portfolioControl',
      desc: '',
      args: [],
    );
  }

  /// `ChainWallet is a secure wallet making the world of web3 accessible to all its users.`
  String get welcomeToChainWalletDesc {
    return Intl.message(
      'ChainWallet is a secure wallet making the world of web3 accessible to all its users.',
      name: 'welcomeToChainWalletDesc',
      desc: '',
      args: [],
    );
  }

  /// `Store and send your digital assets like tokens and ethereum privately.`
  String get incognitoAssetsDesc {
    return Intl.message(
      'Store and send your digital assets like tokens and ethereum privately.',
      name: 'incognitoAssetsDesc',
      desc: '',
      args: [],
    );
  }

  /// `Login with ChainWallet and make transactions to invest, earn, sell and more!`
  String get portfolioControlDesc {
    return Intl.message(
      'Login with ChainWallet and make transactions to invest, earn, sell and more!',
      name: 'portfolioControlDesc',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get getStarted {
    return Intl.message(
      'Get started',
      name: 'getStarted',
      desc: '',
      args: [],
    );
  }

  /// `Wallet connect`
  String get walletConnect {
    return Intl.message(
      'Wallet connect',
      name: 'walletConnect',
      desc: '',
      args: [],
    );
  }

  /// `Import an existing wallet or create a new one`
  String get walletConnectDesc {
    return Intl.message(
      'Import an existing wallet or create a new one',
      name: 'walletConnectDesc',
      desc: '',
      args: [],
    );
  }

  /// `Import using Secret Recovery Phase`
  String get importWallet {
    return Intl.message(
      'Import using Secret Recovery Phase',
      name: 'importWallet',
      desc: '',
      args: [],
    );
  }

  /// `Create a new wallet`
  String get createNewWallet {
    return Intl.message(
      'Create a new wallet',
      name: 'createNewWallet',
      desc: '',
      args: [],
    );
  }

  /// `Import from seed`
  String get importFromSeed {
    return Intl.message(
      'Import from seed',
      name: 'importFromSeed',
      desc: '',
      args: [],
    );
  }

  /// `Secret Recovery Phrase`
  String get secretPhraseHeader {
    return Intl.message(
      'Secret Recovery Phrase',
      name: 'secretPhraseHeader',
      desc: '',
      args: [],
    );
  }

  /// `Import Success`
  String get importSuccess {
    return Intl.message(
      'Import Success',
      name: 'importSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Wallet successfully setup! Click to navigate to the home page.`
  String get setupSuccess {
    return Intl.message(
      'Wallet successfully setup! Click to navigate to the home page.',
      name: 'setupSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Secret Recovery Phrase`
  String get secretPhraseHint {
    return Intl.message(
      'Enter your Secret Recovery Phrase',
      name: 'secretPhraseHint',
      desc: '',
      args: [],
    );
  }

  /// `New Pin`
  String get newPinHeader {
    return Intl.message(
      'New Pin',
      name: 'newPinHeader',
      desc: '',
      args: [],
    );
  }

  /// `New pin`
  String get newPinHint {
    return Intl.message(
      'New pin',
      name: 'newPinHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Pin`
  String get confirmPinHeader {
    return Intl.message(
      'Confirm Pin',
      name: 'confirmPinHeader',
      desc: '',
      args: [],
    );
  }

  /// `Confirm pin`
  String get confirmPinHint {
    return Intl.message(
      'Confirm pin',
      name: 'confirmPinHint',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a pin`
  String get pinNullError {
    return Intl.message(
      'Please enter a pin',
      name: 'pinNullError',
      desc: '',
      args: [],
    );
  }

  /// `Pin must be 6 digits long`
  String get pinShortError {
    return Intl.message(
      'Pin must be 6 digits long',
      name: 'pinShortError',
      desc: '',
      args: [],
    );
  }

  /// `Pins do not match`
  String get pinMatchError {
    return Intl.message(
      'Pins do not match',
      name: 'pinMatchError',
      desc: '',
      args: [],
    );
  }

  /// `Pin is invalid`
  String get pinInvalid {
    return Intl.message(
      'Pin is invalid',
      name: 'pinInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Secret recovery phrase cannot be empty`
  String get seedNullError {
    return Intl.message(
      'Secret recovery phrase cannot be empty',
      name: 'seedNullError',
      desc: '',
      args: [],
    );
  }

  /// `IMPORT`
  String get importButton {
    return Intl.message(
      'IMPORT',
      name: 'importButton',
      desc: '',
      args: [],
    );
  }

  /// `Unlock with Biometrics?`
  String get biometricsUnlock {
    return Intl.message(
      'Unlock with Biometrics?',
      name: 'biometricsUnlock',
      desc: '',
      args: [],
    );
  }

  /// `Create Pin`
  String get createPin {
    return Intl.message(
      'Create Pin',
      name: 'createPin',
      desc: '',
      args: [],
    );
  }

  /// `This will create a new wallet and a Secret Recovery Phrase.`
  String get createPinDesc {
    return Intl.message(
      'This will create a new wallet and a Secret Recovery Phrase.',
      name: 'createPinDesc',
      desc: '',
      args: [],
    );
  }

  /// `Create pin`
  String get createPinButton {
    return Intl.message(
      'Create pin',
      name: 'createPinButton',
      desc: '',
      args: [],
    );
  }

  /// `Secure Your Wallet`
  String get secureWallet {
    return Intl.message(
      'Secure Your Wallet',
      name: 'secureWallet',
      desc: '',
      args: [],
    );
  }

  /// `Your Secret Recovery Phrase makes it easy to back up and restore your account.`
  String get secureWalletDesc {
    return Intl.message(
      'Your Secret Recovery Phrase makes it easy to back up and restore your account.',
      name: 'secureWalletDesc',
      desc: '',
      args: [],
    );
  }

  /// `Don't risk losing your funds. protect your wallet by saving your Recovery Phrase in a place you trust. It's the only way to recover your wallet if you get locked out of the app or get a new device.`
  String get secureWalletExtra {
    return Intl.message(
      'Don\'t risk losing your funds. protect your wallet by saving your Recovery Phrase in a place you trust. It\'s the only way to recover your wallet if you get locked out of the app or get a new device.',
      name: 'secureWalletExtra',
      desc: '',
      args: [],
    );
  }

  /// `This is your seed phrase. Store it in a password manager or write it down on a paper and keep it in a safe place. You'll be asked to re-enter this phrase (in order) on the next step.`
  String get recoveryPhaseShow {
    return Intl.message(
      'This is your seed phrase. Store it in a password manager or write it down on a paper and keep it in a safe place. You\'ll be asked to re-enter this phrase (in order) on the next step.',
      name: 'recoveryPhaseShow',
      desc: '',
      args: [],
    );
  }

  /// `Tap to reveal your seed phrase`
  String get tapToRevealPhrase {
    return Intl.message(
      'Tap to reveal your seed phrase',
      name: 'tapToRevealPhrase',
      desc: '',
      args: [],
    );
  }

  /// `Make sure no one is watching your screen.`
  String get makeSureNoOneIsAround {
    return Intl.message(
      'Make sure no one is watching your screen.',
      name: 'makeSureNoOneIsAround',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Seed Phrase`
  String get confirmPhrase {
    return Intl.message(
      'Confirm Seed Phrase',
      name: 'confirmPhrase',
      desc: '',
      args: [],
    );
  }

  /// `Please select each phrase in order to make sure you have them all right.`
  String get confirmPhraseDesc {
    return Intl.message(
      'Please select each phrase in order to make sure you have them all right.',
      name: 'confirmPhraseDesc',
      desc: '',
      args: [],
    );
  }

  /// `Select each word in the order it was presented to you`
  String get selectWordInOrder {
    return Intl.message(
      'Select each word in the order it was presented to you',
      name: 'selectWordInOrder',
      desc: '',
      args: [],
    );
  }

  /// `Select all three words in order`
  String get inputWordError {
    return Intl.message(
      'Select all three words in order',
      name: 'inputWordError',
      desc: '',
      args: [],
    );
  }

  /// `Selected words are in the wrong order!`
  String get wordOrderError {
    return Intl.message(
      'Selected words are in the wrong order!',
      name: 'wordOrderError',
      desc: '',
      args: [],
    );
  }

  /// `Seed phrase confirmation successful`
  String get confirmationSuccess {
    return Intl.message(
      'Seed phrase confirmation successful',
      name: 'confirmationSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations!`
  String get congratulations {
    return Intl.message(
      'Congratulations!',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `You've successfully protected your wallet. Remember to keep your seed phrase safe, it's your responsibility!`
  String get walletSuccessfullyProtected {
    return Intl.message(
      'You\'ve successfully protected your wallet. Remember to keep your seed phrase safe, it\'s your responsibility!',
      name: 'walletSuccessfullyProtected',
      desc: '',
      args: [],
    );
  }

  /// `ChainWallet cannot recover your wallet should you lose it. You can find your seed phrase in Security & Privacy.`
  String get cannotRecoverWallet {
    return Intl.message(
      'ChainWallet cannot recover your wallet should you lose it. You can find your seed phrase in Security & Privacy.',
      name: 'cannotRecoverWallet',
      desc: '',
      args: [],
    );
  }

  /// `Passcode adds an extra layer of security when using the app`
  String get passcodeAddsSecurity {
    return Intl.message(
      'Passcode adds an extra layer of security when using the app',
      name: 'passcodeAddsSecurity',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate in order to use ChainWallet`
  String get authenticateReason {
    return Intl.message(
      'Please authenticate in order to use ChainWallet',
      name: 'authenticateReason',
      desc: '',
      args: [],
    );
  }

  /// `Secret Recovery Phrases contain 12, 15, 18, 21, or 24 words`
  String get phraseLengthError {
    return Intl.message(
      'Secret Recovery Phrases contain 12, 15, 18, 21, or 24 words',
      name: 'phraseLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Press once again to exit`
  String get pressToExit {
    return Intl.message(
      'Press once again to exit',
      name: 'pressToExit',
      desc: '',
      args: [],
    );
  }

  /// `Public address copied to clipboard`
  String get copiedToClipboard {
    return Intl.message(
      'Public address copied to clipboard',
      name: 'copiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Networks`
  String get networks {
    return Intl.message(
      'Networks',
      name: 'networks',
      desc: '',
      args: [],
    );
  }

  /// `Add a network`
  String get addNetwork {
    return Intl.message(
      'Add a network',
      name: 'addNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Create a new account`
  String get createNewAccount {
    return Intl.message(
      'Create a new account',
      name: 'createNewAccount',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Send to`
  String get sendTo {
    return Intl.message(
      'Send to',
      name: 'sendTo',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get amount {
    return Intl.message(
      'Amount',
      name: 'amount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Import tokens`
  String get importTokens {
    return Intl.message(
      'Import tokens',
      name: 'importTokens',
      desc: '',
      args: [],
    );
  }

  /// `Don't see your imports?`
  String get importTokensLeading {
    return Intl.message(
      'Don\'t see your imports?',
      name: 'importTokensLeading',
      desc: '',
      args: [],
    );
  }

  /// `Search, or public address (0x)`
  String get addressHint {
    return Intl.message(
      'Search, or public address (0x)',
      name: 'addressHint',
      desc: '',
      args: [],
    );
  }

  /// `Recipient address is invalid.`
  String get invalidAddress {
    return Intl.message(
      'Recipient address is invalid.',
      name: 'invalidAddress',
      desc: '',
      args: [],
    );
  }

  /// `Invalid amount.`
  String get invalidAmount {
    return Intl.message(
      'Invalid amount.',
      name: 'invalidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient funds.`
  String get insufficientFunds {
    return Intl.message(
      'Insufficient funds.',
      name: 'insufficientFunds',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Currency conversion, primary currency, language and theme`
  String get generalDescription {
    return Intl.message(
      'Currency conversion, primary currency, language and theme',
      name: 'generalDescription',
      desc: '',
      args: [],
    );
  }

  /// `Security & Privacy`
  String get securityAndPrivacy {
    return Intl.message(
      'Security & Privacy',
      name: 'securityAndPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy settings, private key and wallet Secret Recovery Phrase`
  String get privacyDescription {
    return Intl.message(
      'Privacy settings, private key and wallet Secret Recovery Phrase',
      name: 'privacyDescription',
      desc: '',
      args: [],
    );
  }

  /// `Contacts`
  String get contacts {
    return Intl.message(
      'Contacts',
      name: 'contacts',
      desc: '',
      args: [],
    );
  }

  /// `Add, edit, remove and manage your contacts`
  String get contactsDescription {
    return Intl.message(
      'Add, edit, remove and manage your contacts',
      name: 'contactsDescription',
      desc: '',
      args: [],
    );
  }

  /// `Add and edit custom RPC networks`
  String get networksDescription {
    return Intl.message(
      'Add and edit custom RPC networks',
      name: 'networksDescription',
      desc: '',
      args: [],
    );
  }

  /// `About Chain Wallet`
  String get about {
    return Intl.message(
      'About Chain Wallet',
      name: 'about',
      desc: '',
      args: [],
    );
  }

  /// `Currency Conversion`
  String get currencyConversion {
    return Intl.message(
      'Currency Conversion',
      name: 'currencyConversion',
      desc: '',
      args: [],
    );
  }

  /// `Display fiat values using a specific currency throughout the application.`
  String get currencyConversionDesc {
    return Intl.message(
      'Display fiat values using a specific currency throughout the application.',
      name: 'currencyConversionDesc',
      desc: '',
      args: [],
    );
  }

  /// `Primary Currency`
  String get primaryCurrency {
    return Intl.message(
      'Primary Currency',
      name: 'primaryCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Select Native to prioritize displaying values in the native currency of the chain (e.g. ETH). Select Fiat to prioritize displaying values in your selected fiat currency.`
  String get primaryCurrencyDesc {
    return Intl.message(
      'Select Native to prioritize displaying values in the native currency of the chain (e.g. ETH). Select Fiat to prioritize displaying values in your selected fiat currency.',
      name: 'primaryCurrencyDesc',
      desc: '',
      args: [],
    );
  }

  /// `Current Language`
  String get currentLanguage {
    return Intl.message(
      'Current Language',
      name: 'currentLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Translate the application to a different supported language.`
  String get currentLanguageDesc {
    return Intl.message(
      'Translate the application to a different supported language.',
      name: 'currentLanguageDesc',
      desc: '',
      args: [],
    );
  }

  /// `System Theme`
  String get themeMode {
    return Intl.message(
      'System Theme',
      name: 'themeMode',
      desc: '',
      args: [],
    );
  }

  /// `Follow the preferred theme mode of your device.`
  String get themeModeDesc {
    return Intl.message(
      'Follow the preferred theme mode of your device.',
      name: 'themeModeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Current Theme`
  String get themeType {
    return Intl.message(
      'Current Theme',
      name: 'themeType',
      desc: '',
      args: [],
    );
  }

  /// `Application appearance.`
  String get themeTypeDesc {
    return Intl.message(
      'Application appearance.',
      name: 'themeTypeDesc',
      desc: '',
      args: [],
    );
  }

  /// `Transaction submitted`
  String get txSubmitted {
    return Intl.message(
      'Transaction submitted',
      name: 'txSubmitted',
      desc: '',
      args: [],
    );
  }

  /// `Waiting for confirmation`
  String get txWaiting {
    return Intl.message(
      'Waiting for confirmation',
      name: 'txWaiting',
      desc: '',
      args: [],
    );
  }

  /// `Transaction completed!`
  String get txCompleted {
    return Intl.message(
      'Transaction completed!',
      name: 'txCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Tap to view this transaction`
  String get tapToViewTx {
    return Intl.message(
      'Tap to view this transaction',
      name: 'tapToViewTx',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `USE MAX`
  String get useMax {
    return Intl.message(
      'USE MAX',
      name: 'useMax',
      desc: '',
      args: [],
    );
  }

  /// `Wallet Avatar`
  String get avatarLabel {
    return Intl.message(
      'Wallet Avatar',
      name: 'avatarLabel',
      desc: '',
      args: [],
    );
  }

  /// `Master Account`
  String get master {
    return Intl.message(
      'Master Account',
      name: 'master',
      desc: '',
      args: [],
    );
  }

  /// `Agent Account`
  String get agent {
    return Intl.message(
      'Agent Account',
      name: 'agent',
      desc: '',
      args: [],
    );
  }

  /// `Accounts`
  String get accounts {
    return Intl.message(
      'Accounts',
      name: 'accounts',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
