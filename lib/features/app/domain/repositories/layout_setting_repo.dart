import 'package:result_dart/result_dart.dart';

abstract interface class LayoutSettingRepo {
  bool get isMobileLayoutEnabled;

  AsyncResult<Unit> saveLayoutSetting({required bool isMobileLayoutEnabled});
}
