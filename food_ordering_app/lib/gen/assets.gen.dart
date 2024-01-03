/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/amelia.jpg
  AssetGenImage get amelia => const AssetGenImage('assets/images/amelia.jpg');

  /// File path: assets/images/bankcard.jpg
  AssetGenImage get bankcard =>
      const AssetGenImage('assets/images/bankcard.jpg');

  /// File path: assets/images/happyman.jpg
  AssetGenImage get happyman =>
      const AssetGenImage('assets/images/happyman.jpg');

  /// File path: assets/images/hotdog.jpg
  AssetGenImage get hotdog => const AssetGenImage('assets/images/hotdog.jpg');

  /// File path: assets/images/ibukunoluwa.jpg
  AssetGenImage get ibukunoluwa =>
      const AssetGenImage('assets/images/ibukunoluwa.jpg');

  /// File path: assets/images/map.jpg
  AssetGenImage get map => const AssetGenImage('assets/images/map.jpg');

  /// File path: assets/images/mapdetails.jpg
  AssetGenImage get mapdetails =>
      const AssetGenImage('assets/images/mapdetails.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [amelia, bankcard, happyman, hotdog, ibukunoluwa, map, mapdetails];
}

class $AssetsJsonGen {
  const $AssetsJsonGen();

  /// File path: assets/json/response.json
  String get response => 'assets/json/response.json';

  /// List of all assets
  List<String> get values => [response];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/Address.svg
  String get address => 'assets/svgs/Address.svg';

  /// File path: assets/svgs/CreditCard.svg
  String get creditCard => 'assets/svgs/CreditCard.svg';

  /// File path: assets/svgs/Settings.svg
  String get settings => 'assets/svgs/Settings.svg';

  /// File path: assets/svgs/bag-active.svg
  String get bagActive => 'assets/svgs/bag-active.svg';

  /// File path: assets/svgs/bag.svg
  String get bag => 'assets/svgs/bag.svg';

  /// File path: assets/svgs/home-active.svg
  String get homeActive => 'assets/svgs/home-active.svg';

  /// File path: assets/svgs/home.svg
  String get home => 'assets/svgs/home.svg';

  /// File path: assets/svgs/location-minus.svg
  String get locationMinus => 'assets/svgs/location-minus.svg';

  /// File path: assets/svgs/orders-active.svg
  String get ordersActive => 'assets/svgs/orders-active.svg';

  /// File path: assets/svgs/orders.svg
  String get orders => 'assets/svgs/orders.svg';

  /// File path: assets/svgs/profile-active.svg
  String get profileActive => 'assets/svgs/profile-active.svg';

  /// File path: assets/svgs/profile.svg
  String get profile => 'assets/svgs/profile.svg';

  /// File path: assets/svgs/user-profile.svg
  String get userProfile => 'assets/svgs/user-profile.svg';

  /// List of all assets
  List<String> get values => [
        address,
        creditCard,
        settings,
        bagActive,
        bag,
        homeActive,
        home,
        locationMinus,
        ordersActive,
        orders,
        profileActive,
        profile,
        userProfile
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsJsonGen json = $AssetsJsonGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
