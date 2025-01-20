import 'package:flutter/widgets.dart';

extension MediaQueryExtensions on BuildContext {
  bool get isScreenSmall => MediaQuery.sizeOf(this).width < 600;

  bool get isScreenMedium => MediaQuery.sizeOf(this).width < 800;
}
