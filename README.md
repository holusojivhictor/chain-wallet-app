# Chain Wallet

An on-chain second-layer wallet system.

## Run this project 🚀

You can build and run the project by following these steps:

* Clone this repository
* Checkout the **development** branch
* Run ``flutter pub get``
* Run ``flutter pub run build_runner build`` to run codegen.


* You can use `watch` instead of `build` to continuously look out for your changes.
```sh
$ flutter pub run build_runner watch
```


## Helping with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `intl_en.arb` file at `lib/l10n/intl_en.arb`.

```arb
{
    "@@locale": "en",
    "appTitle": "Chain Wallet",
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "appTitle": "Chain Wallet",
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:chain_wallet/generated/l10n.dart';


@override
Widget build(BuildContext context) {
  final s = S.of(context);
  return Text(s.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n`.

```
├── l10n
│   ├── intl_en.arb
│   ├── intl_es.arb
```

2. Add the translated strings to each `.arb` file:

`intl_en.arb`

```arb
{
    "@@locale": "en",
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

`intl_es.arb`

```arb
{
    "@@locale": "es",
    "helloWorld": "Hola Mundo",
    "@helloWorld": {
        "description": "Hola mundo texto"
    }
}
```

[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
