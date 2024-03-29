// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about": MessageLookupByLibrary.simpleMessage("About Chain Wallet"),
        "accounts": MessageLookupByLibrary.simpleMessage("Accounts"),
        "addNetwork": MessageLookupByLibrary.simpleMessage("Add a network"),
        "addressHint": MessageLookupByLibrary.simpleMessage(
            "Search, or public address (0x)"),
        "agent": MessageLookupByLibrary.simpleMessage("Agent Account"),
        "amount": MessageLookupByLibrary.simpleMessage("Amount"),
        "appName": MessageLookupByLibrary.simpleMessage("Chain Wallet"),
        "authenticateReason": MessageLookupByLibrary.simpleMessage(
            "Please authenticate in order to use ChainWallet"),
        "avatarLabel": MessageLookupByLibrary.simpleMessage("Wallet Avatar"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "balance": MessageLookupByLibrary.simpleMessage("Balance"),
        "biometricsUnlock":
            MessageLookupByLibrary.simpleMessage("Unlock with Biometrics?"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cannotRecoverWallet": MessageLookupByLibrary.simpleMessage(
            "ChainWallet cannot recover your wallet should you lose it. You can find your seed phrase in Security & Privacy."),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "confirmPhrase":
            MessageLookupByLibrary.simpleMessage("Confirm Seed Phrase"),
        "confirmPhraseDesc": MessageLookupByLibrary.simpleMessage(
            "Please select each phrase in order to make sure you have them all right."),
        "confirmPinHeader": MessageLookupByLibrary.simpleMessage("Confirm Pin"),
        "confirmPinHint": MessageLookupByLibrary.simpleMessage("Confirm pin"),
        "confirmationSuccess": MessageLookupByLibrary.simpleMessage(
            "Seed phrase confirmation successful"),
        "congratulations":
            MessageLookupByLibrary.simpleMessage("Congratulations!"),
        "contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
        "contactsDescription": MessageLookupByLibrary.simpleMessage(
            "Add, edit, remove and manage your contacts"),
        "copiedToClipboard": MessageLookupByLibrary.simpleMessage(
            "Public address copied to clipboard"),
        "createNewAccount":
            MessageLookupByLibrary.simpleMessage("Create a new account"),
        "createNewWallet":
            MessageLookupByLibrary.simpleMessage("Create a new wallet"),
        "createPin": MessageLookupByLibrary.simpleMessage("Create Pin"),
        "createPinButton": MessageLookupByLibrary.simpleMessage("Create pin"),
        "createPinDesc": MessageLookupByLibrary.simpleMessage(
            "This will create a new wallet and a Secret Recovery Phrase."),
        "currencyConversion":
            MessageLookupByLibrary.simpleMessage("Currency Conversion"),
        "currencyConversionDesc": MessageLookupByLibrary.simpleMessage(
            "Display fiat values using a specific currency throughout the application."),
        "currentLanguage":
            MessageLookupByLibrary.simpleMessage("Current Language"),
        "currentLanguageDesc": MessageLookupByLibrary.simpleMessage(
            "Translate the application to a different supported language."),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "english": MessageLookupByLibrary.simpleMessage("English"),
        "finish": MessageLookupByLibrary.simpleMessage("Finish"),
        "from": MessageLookupByLibrary.simpleMessage("From"),
        "general": MessageLookupByLibrary.simpleMessage("General"),
        "generalDescription": MessageLookupByLibrary.simpleMessage(
            "Currency conversion, primary currency, language and theme"),
        "getStarted": MessageLookupByLibrary.simpleMessage("Get started"),
        "goHome": MessageLookupByLibrary.simpleMessage("Go Home"),
        "hide": MessageLookupByLibrary.simpleMessage("Hide"),
        "history": MessageLookupByLibrary.simpleMessage("History"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "importButton": MessageLookupByLibrary.simpleMessage("IMPORT"),
        "importFromSeed":
            MessageLookupByLibrary.simpleMessage("Import from seed"),
        "importSuccess": MessageLookupByLibrary.simpleMessage("Import Success"),
        "importTokens": MessageLookupByLibrary.simpleMessage("Import tokens"),
        "importTokensLeading":
            MessageLookupByLibrary.simpleMessage("Don\'t see your imports?"),
        "importWallet": MessageLookupByLibrary.simpleMessage(
            "Import using Secret Recovery Phase"),
        "incognitoAssets": MessageLookupByLibrary.simpleMessage(
            "Move your assets around incognito"),
        "incognitoAssetsDesc": MessageLookupByLibrary.simpleMessage(
            "Store and send your digital assets like tokens and ethereum privately."),
        "inputWordError": MessageLookupByLibrary.simpleMessage(
            "Select all three words in order"),
        "insufficientFunds":
            MessageLookupByLibrary.simpleMessage("Insufficient funds."),
        "invalidAddress": MessageLookupByLibrary.simpleMessage(
            "Recipient address is invalid."),
        "invalidAmount":
            MessageLookupByLibrary.simpleMessage("Invalid amount."),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "makeSureNoOneIsAround": MessageLookupByLibrary.simpleMessage(
            "Make sure no one is watching your screen."),
        "master": MessageLookupByLibrary.simpleMessage("Master Account"),
        "networks": MessageLookupByLibrary.simpleMessage("Networks"),
        "networksDescription": MessageLookupByLibrary.simpleMessage(
            "Add and edit custom RPC networks"),
        "newPinHeader": MessageLookupByLibrary.simpleMessage("New Pin"),
        "newPinHint": MessageLookupByLibrary.simpleMessage("New pin"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "ok": MessageLookupByLibrary.simpleMessage("Ok"),
        "okay": MessageLookupByLibrary.simpleMessage("Okay"),
        "passcodeAddsSecurity": MessageLookupByLibrary.simpleMessage(
            "Passcode adds an extra layer of security when using the app"),
        "phraseLengthError": MessageLookupByLibrary.simpleMessage(
            "Secret Recovery Phrases contain 12, 15, 18, 21, or 24 words"),
        "pinInvalid": MessageLookupByLibrary.simpleMessage("Pin is invalid"),
        "pinMatchError":
            MessageLookupByLibrary.simpleMessage("Pins do not match"),
        "pinNullError":
            MessageLookupByLibrary.simpleMessage("Please enter a pin"),
        "pinShortError":
            MessageLookupByLibrary.simpleMessage("Pin must be 6 digits long"),
        "portfolioControl": MessageLookupByLibrary.simpleMessage(
            "Complete control over your portfolio"),
        "portfolioControlDesc": MessageLookupByLibrary.simpleMessage(
            "Login with ChainWallet and make transactions to invest, earn, sell and more!"),
        "pressToExit":
            MessageLookupByLibrary.simpleMessage("Press once again to exit"),
        "primaryCurrency":
            MessageLookupByLibrary.simpleMessage("Primary Currency"),
        "primaryCurrencyDesc": MessageLookupByLibrary.simpleMessage(
            "Select Native to prioritize displaying values in the native currency of the chain (e.g. ETH). Select Fiat to prioritize displaying values in your selected fiat currency."),
        "privacyDescription": MessageLookupByLibrary.simpleMessage(
            "Privacy settings, private key and wallet Secret Recovery Phrase"),
        "recoveryPhaseShow": MessageLookupByLibrary.simpleMessage(
            "This is your seed phrase. Store it in a password manager or write it down on a paper and keep it in a safe place. You\'ll be asked to re-enter this phrase (in order) on the next step."),
        "secretPhraseHeader":
            MessageLookupByLibrary.simpleMessage("Secret Recovery Phrase"),
        "secretPhraseHint": MessageLookupByLibrary.simpleMessage(
            "Enter your Secret Recovery Phrase"),
        "secureWallet":
            MessageLookupByLibrary.simpleMessage("Secure Your Wallet"),
        "secureWalletDesc": MessageLookupByLibrary.simpleMessage(
            "Your Secret Recovery Phrase makes it easy to back up and restore your account."),
        "secureWalletExtra": MessageLookupByLibrary.simpleMessage(
            "Don\'t risk losing your funds. protect your wallet by saving your Recovery Phrase in a place you trust. It\'s the only way to recover your wallet if you get locked out of the app or get a new device."),
        "securityAndPrivacy":
            MessageLookupByLibrary.simpleMessage("Security & Privacy"),
        "seedNullError": MessageLookupByLibrary.simpleMessage(
            "Secret recovery phrase cannot be empty"),
        "selectWordInOrder": MessageLookupByLibrary.simpleMessage(
            "Select each word in the order it was presented to you"),
        "send": MessageLookupByLibrary.simpleMessage("Send"),
        "sendTo": MessageLookupByLibrary.simpleMessage("Send to"),
        "settings": MessageLookupByLibrary.simpleMessage("Settings"),
        "setupSuccess": MessageLookupByLibrary.simpleMessage(
            "Wallet successfully setup! Click to navigate to the home page."),
        "show": MessageLookupByLibrary.simpleMessage("Show"),
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "tapToRevealPhrase": MessageLookupByLibrary.simpleMessage(
            "Tap to reveal your seed phrase"),
        "tapToViewTx": MessageLookupByLibrary.simpleMessage(
            "Tap to view this transaction"),
        "themeMode": MessageLookupByLibrary.simpleMessage("System Theme"),
        "themeModeDesc": MessageLookupByLibrary.simpleMessage(
            "Follow the preferred theme mode of your device."),
        "themeType": MessageLookupByLibrary.simpleMessage("Current Theme"),
        "themeTypeDesc":
            MessageLookupByLibrary.simpleMessage("Application appearance."),
        "to": MessageLookupByLibrary.simpleMessage("To"),
        "txCompleted":
            MessageLookupByLibrary.simpleMessage("Transaction completed!"),
        "txSubmitted":
            MessageLookupByLibrary.simpleMessage("Transaction submitted"),
        "txWaiting":
            MessageLookupByLibrary.simpleMessage("Waiting for confirmation"),
        "useMax": MessageLookupByLibrary.simpleMessage("USE MAX"),
        "view": MessageLookupByLibrary.simpleMessage("View"),
        "walletConnect": MessageLookupByLibrary.simpleMessage("Wallet connect"),
        "walletConnectDesc": MessageLookupByLibrary.simpleMessage(
            "Import an existing wallet or create a new one"),
        "walletSuccessfullyProtected": MessageLookupByLibrary.simpleMessage(
            "You\'ve successfully protected your wallet. Remember to keep your seed phrase safe, it\'s your responsibility!"),
        "welcomeToChainWallet":
            MessageLookupByLibrary.simpleMessage("Welcome to Chain Wallet"),
        "welcomeToChainWalletDesc": MessageLookupByLibrary.simpleMessage(
            "ChainWallet is a secure wallet making the world of web3 accessible to all its users."),
        "wordOrderError": MessageLookupByLibrary.simpleMessage(
            "Selected words are in the wrong order!")
      };
}
