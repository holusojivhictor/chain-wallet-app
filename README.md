# Chain Wallet

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

An on-chain second-layer wallet system.

---

## Run this project 🚀

You can build and run the project by following these steps:

* Clone this repository
* Checkout the **development** branch
* Run ``flutter pub get``
* Run ``dart run build_runner build`` to run codegen.


* You can use `watch` instead of `build` to continuously look out for your changes.
```sh
$ dart run build_runner watch
```


## Helping with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

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

### [License: MIT](LICENSE.md)

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
