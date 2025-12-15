import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portfolio/features/app/domain/repositories/layout_setting_repo.dart';
import 'package:portfolio/features/app/domain/services/app_layout_service.dart';
import 'package:result_dart/result_dart.dart';

class MockLayoutSettingRepo extends Mock implements LayoutSettingRepo {}

void main() {
  late LayoutSettingRepo layoutSettingRepo;
  late AppLayoutService appLayoutService;

  setUp(() {
    layoutSettingRepo = MockLayoutSettingRepo();
    appLayoutService = AppLayoutService(layoutSettingRepo);
  });

  group('AppLayoutService', () {
    test('isMobileEnabled returns correctly from repo', () {
      when(() => layoutSettingRepo.isMobileLayoutEnabled).thenReturn(true);
      expect(appLayoutService.isMobileEnabled, true);
    });

    test(
      'toggleMobile calls saveLayoutSetting when value is different',
      () async {
        // Arrange
        when(() => layoutSettingRepo.isMobileLayoutEnabled).thenReturn(false);
        when(
          () => layoutSettingRepo.saveLayoutSetting(
            isMobileLayoutEnabled: any(named: 'isMobileLayoutEnabled'),
          ),
        ).thenAnswer((_) async => Success.unit());

        // Act
        await appLayoutService.toggleMobile(isMobileLayoutEnabled: true);

        // Assert
        verify(
          () =>
              layoutSettingRepo.saveLayoutSetting(isMobileLayoutEnabled: true),
        ).called(1);
      },
    );

    test(
      'toggleMobile does NOT call saveLayoutSetting when value is same',
      () async {
        // Arrange
        when(() => layoutSettingRepo.isMobileLayoutEnabled).thenReturn(false);

        // Act
        await appLayoutService.toggleMobile(isMobileLayoutEnabled: false);

        // Assert
        verifyNever(
          () => layoutSettingRepo.saveLayoutSetting(
            isMobileLayoutEnabled: any(named: 'isMobileLayoutEnabled'),
          ),
        );
      },
    );
  });
}
