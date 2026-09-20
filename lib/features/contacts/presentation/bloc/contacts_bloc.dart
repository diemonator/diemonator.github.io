import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/services/contacts_service.dart';
import 'contacts_event.dart';
import 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(this._contactsService) : super(const ContactsState()) {
    on<ContactsLoadEvent>(_onLoad);
    on<ContactsOpenMethodEvent>(
      (event, emit) => _contactsService.open(event.method),
    );
    on<ContactsOpenLinkEvent>(
      (event, emit) => _contactsService.openLink(event.link),
    );

    add(const ContactsLoadEvent());
  }

  final ContactsService _contactsService;

  void _onLoad(ContactsLoadEvent event, Emitter<ContactsState> emit) {
    emit(
      ContactsState(
        methods: _contactsService.contactMethods,
        links: _contactsService.socialLinks,
      ),
    );
  }
}
