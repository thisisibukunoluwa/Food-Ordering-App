/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsClassicpizzaGen {
  const $AssetsClassicpizzaGen();

  /// File path: assets/classicpizza/bbqbeef.jpg
  AssetGenImage get bbqbeef =>
      const AssetGenImage('assets/classicpizza/bbqbeef.jpg');

  /// File path: assets/classicpizza/bbqchicken.jpg
  AssetGenImage get bbqchicken =>
      const AssetGenImage('assets/classicpizza/bbqchicken.jpg');

  /// File path: assets/classicpizza/veggiesupreme.jpg
  AssetGenImage get veggiesupreme =>
      const AssetGenImage('assets/classicpizza/veggiesupreme.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [bbqbeef, bbqchicken, veggiesupreme];
}

class $AssetsDrinksGen {
  const $AssetsDrinksGen();

  /// File path: assets/drinks/soda.jpg
  AssetGenImage get soda => const AssetGenImage('assets/drinks/soda.jpg');

  /// File path: assets/drinks/water.jpg
  AssetGenImage get water => const AssetGenImage('assets/drinks/water.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [soda, water];
}

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

  /// File path: assets/images/map.jpg
  AssetGenImage get map => const AssetGenImage('assets/images/map.jpg');

  /// File path: assets/images/mapdetails.jpg
  AssetGenImage get mapdetails =>
      const AssetGenImage('assets/images/mapdetails.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [amelia, bankcard, happyman, hotdog, map, mapdetails];
}

class $AssetsPopularrestaurantsGen {
  const $AssetsPopularrestaurantsGen();

  /// File path: assets/popularrestaurants/burgerking.jpg
  AssetGenImage get burgerking =>
      const AssetGenImage('assets/popularrestaurants/burgerking.jpg');

  /// File path: assets/popularrestaurants/coffeehouse.jpg
  AssetGenImage get coffeehouse =>
      const AssetGenImage('assets/popularrestaurants/coffeehouse.jpg');

  /// File path: assets/popularrestaurants/icecreamfactory.jpg
  AssetGenImage get icecreamfactory =>
      const AssetGenImage('assets/popularrestaurants/icecreamfactory.jpg');

  /// File path: assets/popularrestaurants/pizzaplace.jpg
  AssetGenImage get pizzaplace =>
      const AssetGenImage('assets/popularrestaurants/pizzaplace.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [burgerking, coffeehouse, icecreamfactory, pizzaplace];
}

class $AssetsPremiumpizzaGen {
  const $AssetsPremiumpizzaGen();

  /// File path: assets/premiumpizza/bbqmega.jpg
  AssetGenImage get bbqmega =>
      const AssetGenImage('assets/premiumpizza/bbqmega.jpg');

  /// File path: assets/premiumpizza/chickenbali.jpg
  AssetGenImage get chickenbali =>
      const AssetGenImage('assets/premiumpizza/chickenbali.jpg');

  /// File path: assets/premiumpizza/extravaganza.jpg
  AssetGenImage get extravaganza =>
      const AssetGenImage('assets/premiumpizza/extravaganza.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [bbqmega, chickenbali, extravaganza];
}

class $AssetsSidesGen {
  const $AssetsSidesGen();

  /// File path: assets/sides/chickenwings.jpg
  AssetGenImage get chickenwings =>
      const AssetGenImage('assets/sides/chickenwings.jpg');

  /// File path: assets/sides/frenchfries.jpg
  AssetGenImage get frenchfries =>
      const AssetGenImage('assets/sides/frenchfries.jpg');

  /// File path: assets/sides/salad.jpg
  AssetGenImage get salad => const AssetGenImage('assets/sides/salad.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [chickenwings, frenchfries, salad];
}

class Assets {
  Assets._();

  static const $AssetsClassicpizzaGen classicpizza = $AssetsClassicpizzaGen();
  static const $AssetsDrinksGen drinks = $AssetsDrinksGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsPopularrestaurantsGen popularrestaurants =
      $AssetsPopularrestaurantsGen();
  static const $AssetsPremiumpizzaGen premiumpizza = $AssetsPremiumpizzaGen();
  static const $AssetsSidesGen sides = $AssetsSidesGen();
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
