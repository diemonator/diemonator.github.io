import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/timeline_entry.dart';
import '../../domain/services/profile_service.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._profileService) : super(const ProfileState()) {
    on<ProfileLoadEvent>(_onLoad);

    add(const ProfileLoadEvent());
  }

  final ProfileService _profileService;

  void _onLoad(ProfileLoadEvent event, Emitter<ProfileState> emit) {
    emit(
      ProfileState(
        work: _profileService.entriesOf(TimelineKind.work),
        education: _profileService.entriesOf(TimelineKind.education),
      ),
    );
  }
}
