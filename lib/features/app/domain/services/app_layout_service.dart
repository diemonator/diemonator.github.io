import 'package:flutter/foundation.dart';
import 'package:result_dart/result_dart.dart';

import '../repositories/layout_setting_repo.dart';

class AppLayoutService extends ChangeNotifier {
  AppLayoutService(this._layoutSettingRepo);

  final LayoutSettingRepo _layoutSettingRepo;

  bool get isMobileEnabled => _layoutSettingRepo.isMobileLayoutEnabled;

  Future<void> toggleMobile({required bool isMobileLayoutEnabled}) async {
    if (isMobileLayoutEnabled != isMobileEnabled) {
      await _layoutSettingRepo
          .saveLayoutSetting(isMobileLayoutEnabled: isMobileLayoutEnabled)
          .onSuccess((_) => notifyListeners());
    }
  }
}
