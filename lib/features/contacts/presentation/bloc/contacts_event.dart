import '../../domain/models/contact_method.dart';
import '../../domain/models/social_link.dart';

sealed class ContactsEvent {
  const ContactsEvent();
}

final class ContactsLoadEvent extends ContactsEvent {
  const ContactsLoadEvent();
}

final class ContactsOpenMethodEvent extends ContactsEvent {
  const ContactsOpenMethodEvent(this.method);

  final ContactMethod method;
}

final class ContactsOpenLinkEvent extends ContactsEvent {
  const ContactsOpenLinkEvent(this.link);

  final SocialLink link;
}
