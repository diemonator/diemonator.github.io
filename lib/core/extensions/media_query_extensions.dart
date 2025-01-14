import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/app/presentation/app_cubit.dart';

extension MediaQueryExtensions on BuildContext {
  static const double mobileScreen = 480;
  static const double tabletScreen = 800;
  static const double desktopScreen = 1000;

  bool get _isMobileLayoutEnabled {
    return read<AppCubit>().state.isMobileLayoutEnabled;
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

  ({int columnCount, double ratio}) get gridChildCountAndRatio {
    return screenWidth - 300 <= mobileScreen
        ? (columnCount: 1, ratio: 1.4)
        : (columnCount: 2, ratio: 2);
  }

  double textScale(double scale) {
    final textScale = isMobileScreen ? 0.7 : 1.0;
    final result = scale * textScale;

    return max(result, 14.0);
  }
}
