# Flutter template app

[![Flutter](https://badgen.net/badge/flutter/2.8.1/blue)](https://flutter.dev/docs/development/tools/sdk/releases)
[![Flutter](https://badgen.net/badge/github/releases/blue)](https://flutter.dev)

A mobile client app for TalentTech.Learning box solution

---

## Getting Started 🚀

This project contains 2 flavors:

- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

### Flutter Version Manager setup
- Install fvm on your machine ([guide](https://fvm.app/docs/getting_started/installation))
- Configure your IDE (VSCode or Android Studio) ([guide](https://fvm.app/docs/getting_started/configuration))
- Add path to Flutter sdk to your `~/.zshrc` file `export PATH=[REPO_PATH]/lxp-mobile/.fvm/flutter_sdk/bin:$PATH`. Reload all launched terminals.
- Check all with `fvm doctor`.
- Project uses Flutter 2.8.1 version. So, run `fvm install 2.8.1` and then `fvm use 2.8.1`

### AndroidStudio setup
- Launch Android Studio. Go to `Preferences` -> `Plugins` - install Flutter plugin. Go to `Languages & Frameworks` -> `Flutter` and setup path to `[REPO_PATH]/lxp-mobile/.fvm/flutter_sdk/`.
- Add to folder `.idea/runConfigurations/` `staging.xml` and `production.xml` files:
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="staging" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="buildFlavor" value="staging" />
    <option name="filePath" value="$PROJECT_DIR$/lib/main_staging.dart" />
    <method v="2" />
  </configuration>
</component>
```
```xml
<component name="ProjectRunConfigurationManager">
  <configuration default="false" name="production" type="FlutterRunConfigurationType" factoryName="Flutter">
    <option name="buildFlavor" value="production" />
    <option name="filePath" value="$PROJECT_DIR$/lib/main_production.dart" />
    <method v="2" />
  </configuration>
</component>
```

### VSCode setup
- Add to file `.vscode/launch.json`:
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Launch staging",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_staging.dart",
      "args": [
        "--flavor",
        "staging",
        "--target",
        "lib/main_staging.dart"
      ]
    },
    {
      "name": "Launch production",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_production.dart",
      "args": [
        "--flavor",
        "production",
        "--target",
        "lib/main_production.dart"
      ]
    }
  ]
}
```
- Add to local (`.vscode/settings.json`) or global settings file `"dart.lineLength": 120` to setup line max length

### Code generating

You need to generate code before app running

```sh
$ ./scripts/get_all.sh --useFvm
```

---

## Running Tests 🧪

To run all unit, golden and widget tests use the following command:

```sh
$ ./scripts/coverage.sh --useFvm
```

---

## Working with Translations 🌐

### Adding Strings

1. To add a new localizable string, open the `intl_en.arb` file at `lib/l10n/intl_en.arb`.

```json
{
    "counterAppBarTitle": "Counter"
}
```

2. Then add a new key/value and save

```json
{
    "counterAppBarTitle": "Counter",
    "helloWorld": "Hello World"
}
```

3. Use the new string

```dart
import 'package:nitro_lxp_mobile/generated/l10n.dart';

@override
Widget build(BuildContext context) {
  return Text(S.of(context).helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/`.

```
├── l10n
│   ├── intl_en.arb
│   └── intl_es.arb
```

2. Add the translated strings to each `.arb` file:
