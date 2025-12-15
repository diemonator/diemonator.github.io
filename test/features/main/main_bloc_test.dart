import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/core/navigation/app_routes.dart';
import 'package:portfolio/features/main/main_bloc.dart';
import 'package:portfolio/features/main/main_event.dart';
import 'package:portfolio/features/main/main_state.dart';

void main() {
  group('MainBloc', () {
    test('initial state is correct', () {
      expect(MainBloc().state, const MainState());
    });

    blocTest<MainBloc, MainState>(
      'emits new index when MainNavigationEvent is added',
      build: MainBloc.new,
      act: (bloc) => bloc.add(const MainNavigationEvent(1)),
      expect: () => [const MainState(currentIndex: 1)],
    );

    blocTest<MainBloc, MainState>(
      'emits new index when MainSyncRouteEvent is added with valid path',
      build: MainBloc.new,
      act: (bloc) {
        // Find a valid path from AppRoutes
        final validPath = AppRoutes
            .tabs
            .last
            .path; // e.g., '/contacts' or similar depending on definitions
        bloc.add(MainSyncRouteEvent(validPath));
      },
      expect: () => [
        isA<MainState>().having(
          (state) => state.currentIndex,
          'currentIndex',
          AppRoutes.tabs.length - 1,
        ),
      ],
    );

    blocTest<MainBloc, MainState>(
      'does not emit when MainSyncRouteEvent is added with invalid path',
      build: MainBloc.new,
      act: (bloc) => bloc.add(const MainSyncRouteEvent('/invalid-path')),
      expect: () => [],
    );

    blocTest<MainBloc, MainState>(
      'does not emit when MainSyncRouteEvent is added with same index',
      build: MainBloc.new,
      act: (bloc) => bloc.add(MainSyncRouteEvent(AppRoutes.tabs.first.path)),
      expect: () => [],
    );
  });
}
