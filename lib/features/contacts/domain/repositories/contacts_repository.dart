import '../models/contact_method.dart';
import '../models/social_link.dart';

abstract interface class ContactsRepository {
  List<ContactMethod> get contactMethods;

  List<SocialLink> get socialLinks;
}
