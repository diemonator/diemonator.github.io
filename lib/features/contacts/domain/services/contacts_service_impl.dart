import 'package:url_launcher/url_launcher.dart';

import '../models/contact_method.dart';
import '../models/social_link.dart';
import '../repositories/contacts_repository.dart';
import 'contacts_service.dart';

/// Injected so tests do not reach the platform channel.
typedef UrlLauncher = Future<bool> Function(Uri uri);

class ContactsServiceImpl implements ContactsService {
  ContactsServiceImpl(
    this._repository, {
    UrlLauncher? launch,
    UrlLauncher? canLaunch,
  }) : _launch = launch ?? launchUrl,
       _canLaunch = canLaunch ?? canLaunchUrl;

  final ContactsRepository _repository;
  final UrlLauncher _launch;
  final UrlLauncher _canLaunch;

  @override
  List<ContactMethod> get contactMethods => _repository.contactMethods;

  @override
  List<SocialLink> get socialLinks => _repository.socialLinks;

  @override
  Future<void> open(ContactMethod method) async {
    final uri = switch (method.action) {
      ContactAction.none => null,
      ContactAction.tel => Uri(scheme: 'tel', path: method.value),
      ContactAction.mailto => Uri(scheme: 'mailto', path: method.value),
    };

    if (uri != null) {
      await _openUri(uri);
    }
  }

  @override
  Future<void> openLink(SocialLink link) => _openUri(Uri.parse(link.url));

  Future<void> _openUri(Uri uri) async {
    if (await _canLaunch(uri)) {
      await _launch(uri);
    }
  }
}
