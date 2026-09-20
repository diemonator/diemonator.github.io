import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/app/presentation/bloc/app_bloc.dart';

extension MediaQueryExtensions on BuildContext {
  static const double mobileScreen = 480;
  static const double tabletScreen = 800;
  static const double desktopScreen = 1000;

  /// Long-form text stops growing past this; wider screens gain side gutters
  /// instead of longer lines.
  static const double maxContentWidth = 1100;

  /// NavigationRail with [NavigationRailLabelType.all] is ~80 wide.
  /// ponytail: constant, not measured — bump it if the rail gains a leading
  /// widget or extended labels.
  static const double _navRailWidth = 80;

  bool get _isMobileLayoutEnabled {
    return read<AppBloc>().state.isMobileLayoutEnabled;
  }

  double get screenWidth {
    return MediaQuery.sizeOf(this).width;
  }

  bool get isTabletSizedScreen {
    return screenWidth <= tabletScreen;
  }

  bool get isMobileScreen {
    return (!kIsWeb || _isMobileLayoutEnabled) && screenWidth <= mobileScreen;
  }

  bool get isTabletScreen {
    return (!kIsWeb || _isMobileLayoutEnabled) && isTabletSizedScreen;
  }

  bool get isDesktopScreen {
    return (!kIsWeb || _isMobileLayoutEnabled) && screenWidth > tabletScreen;
  }

  /// Width actually available to a section, i.e. minus the navigation rail
  /// that the desktop layout puts beside it.
  double get contentWidth {
    return screenWidth - (isMobileScreen ? 0 : _navRailWidth);
  }

  /// Side gutters for readable text: a small margin on phones, growing into
  /// centring whitespace once the screen outgrows [maxContentWidth].
  /// Full-bleed widgets (banners, images) belong outside this padding.
  EdgeInsets get contentPadding {
    final gutter = isMobileScreen
        ? 16.0
        : isTabletSizedScreen
        ? 24.0
        : 42.0;

    return EdgeInsets.symmetric(
      horizontal: max(gutter, (contentWidth - maxContentWidth) / 2),
    );
  }

  ({int columnCount, double ratio}) get gridChildCountAndRatio {
    final columnCount = (contentWidth / 360).floor().clamp(1, 4);

    return (columnCount: columnCount, ratio: columnCount == 1 ? 1.4 : 1.6);
  }

  double textScale(double scale) {
    final textScale = isMobileScreen ? 0.7 : 1.0;
    final result = scale * textScale;

    return max(result, 14.0);
  }
}
