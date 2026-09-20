import '../models/contact_method.dart';
import '../models/social_link.dart';

abstract interface class ContactsService {
  List<ContactMethod> get contactMethods;

  List<SocialLink> get socialLinks;

  /// Opens a contact row's handler. No-op for [ContactAction.none] and for a
  /// scheme the platform has no handler for, so the UI never needs to check.
  Future<void> open(ContactMethod method);

  Future<void> openLink(SocialLink link);
}
