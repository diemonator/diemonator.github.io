import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/app_assets.dart';

/// Warms every declared asset so a section does not pop in blank the first
/// time it is opened.
///
/// Mounted from `MaterialApp.builder`, which is the highest context that has
/// the [MediaQuery] and [DefaultAssetBundle] that image resolution needs — and
/// it is built once for the app's lifetime, unlike the routed pages below it.
class AssetPrecacher extends StatefulWidget {
  const AssetPrecacher({required this.child, super.key});

  final Widget child;

  @override
  State<AssetPrecacher> createState() => _AssetPrecacherState();
}

class _AssetPrecacherState extends State<AssetPrecacher> {
  bool _warmed = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // didChangeDependencies also fires on theme and locale changes; the caches
    // are keyed per asset, so re-warming would be harmless but wasteful.
    if (_warmed) {
      return;
    }
    _warmed = true;

    _warm();
  }

  void _warm() {
    for (final path in AppAssets.images) {
      // Errors are swallowed: a missing or corrupt asset must not take down
      // the app from a background warm-up. It still fails visibly at the
      // widget that actually renders it.
      precacheImage(AssetImage(path), context, onError: _ignore);
    }

    for (final path in AppAssets.svgs) {
      // loadBytes goes through svg.cache internally, so this both decodes and
      // caches under the same key SvgPicture.asset will look up.
      SvgAssetLoader(path).loadBytes(context).catchError(_ignoreSvg);
    }
  }

  void _ignore(Object error, StackTrace? stackTrace) {
    debugPrint('Asset precache failed: $error');
  }

  Future<ByteData> _ignoreSvg(Object error) {
    debugPrint('SVG precache failed: $error');

    return Future<ByteData>.value(ByteData(0));
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
