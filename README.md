# IZ*ONE Fan App <img src="./assets/launcher.png" width="64" alt="App icon"/>

An unofficial fan-made app dedicated to [IZ*ONE](http://iz-one.co.kr/).

## Contributing

The easiest way to contribute to this app is to simply use it and give feedback on how the app can be improved.
You may [submit issues](https://github.com/airicbear/izone-app/issues) with your device specifications for any problems you are facing or for any feedback or suggestions.

Another way you can contribute is to add translations.
Edit each of the `.arb` files in `lib/l10n/` so that they all have the same fields and submit a pull request.

## Building

1. Install Flutter: https://flutter.dev/docs/get-started/install

    - Follow the web setup (get [Google Chrome](https://www.google.com/chrome/)): https://flutter.dev/docs/get-started/web

    - Follow the linux setup: https://flutter.dev/desktop

2. Install Android Studio: https://developer.android.com/studio

3. Install VS Code: https://code.visualstudio.com/

4. Install the following VS Code plugins:

    - Dart: https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code

    - Flutter: https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter

    - Flutter Intl: https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl

5. Git clone this repository

6. Use a `flutter build` command:

    - Android: `flutter build apk --split-per-abi`

    - Web: `flutter build web --release`

7. You can also just run the app using your editor's Run/Debug button or using the command line:

    - Android: `flutter run`

    - Web: `flutter run -d chrome`

    - Linux: `flutter run -d linux`

    By default, it will run the app in debug mode.
    Add `--release` to run the release version.

## Known Issues

### Web version

The Web version works okay for the most part.

1. Embedded Youtube videos don't work in app (see the [flutter_widget_from_html](https://pub.dev/packages/flutter_widget_from_html) package).

    - As a workaround for this issue, the app simply opens the Youtube video in a new tab. ([link to relevant commit](https://github.com/airicbear/izone-app/commit/9cee33ea1d4a685b021c35a040c553c74bd2e1be))

2. ~~Cached network images don't work (see the [cached_network_image](https://pub.dev/packages/cached_network_image) package).~~

    - **Update 2020-07-19**: Reverting back to local images to fix this. ([link to relevant commit](https://github.com/airicbear/izone-app/commit/323a025c72f3396bf61585b2389cd6f077852cbe))

### App layout

There is an issue with the [`PageController`](https://api.flutter.dev/flutter/widgets/PageController-class.html) going beyond the last page when the [`LayoutBuilder`](https://api.flutter.dev/flutter/widgets/LayoutBuilder-class.html) switches from vertical to horizontal layout.
This might be a bug concerning the use of [`CustomScrollView`](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html) under a [`PageView`](https://api.flutter.dev/flutter/widgets/PageView-class.html), I'm not exactly sure.
It may be worth checking out the [`SliverLayoutBuilder`](https://api.flutter.dev/flutter/widgets/SliverLayoutBuilder-class.html) class.

**UPDATE:** It seems other people have been having the same issue. See issue [#61156](https://github.com/flutter/flutter/issues/61156).

### Embedded Youtube video (Android)

~~The audio from the embedded Youtube video persists if the app is not closed and the user decides to go out of the app or turns off their display.
I figure this may be more of a feature than a bug, though, potentially allowing for Youtube streaming without ads.~~

**UPDATE:** Switching to the [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter) package, this is no longer an issue. ([relevant commit](https://github.com/airicbear/izone-app/commit/f9473da71deda0ee4a5cfea273444bc1f746f1c2))

~~**WARNING:** There is something *SEVERELY* wrong with the embedded Youtube videos that cause the Android device to be COMPLETELY borked. I'm trying to fix this ASAP.~~

**UPDATE:** Added `WAKE_LOCK` permissions by adding `<uses-permission android:name="android.permission.WAKE_LOCK"/>` to the `AndroidManifest.xml` ([link to relevant commit](https://github.com/airicbear/izone-app/commit/ad519808252dea0b584199ac01d17582bd4eac1c)).
Hopefully this should fix the issue above.
See https://developer.android.com/reference/android/os/PowerManager for more details.
NOTE from the Android Developers documentation:

> **Device battery life will be significantly affected by the use of this API.**


## References

- https://dbkpop.com/group/izone
- https://www.izone-official.com
- https://kprofiles.com/izone-members-profile/
- https://kpop.fandom.com/wiki/IZ*ONE
- http://iz-one.co.kr/photos/
- https://genius.com/artists/Izone
- https://colorcodedlyrics.com/2018/11/iz-one-aijeuwon-produce-48-lyrics-index
- https://www.youtube.com/results?search_query=iz%2Aone+color+coded+lyrics
- https://translate.google.com/#view=home&op=translate&sl=ko&tl=en
- https://en.wikipedia.org/wiki/Iz*One
