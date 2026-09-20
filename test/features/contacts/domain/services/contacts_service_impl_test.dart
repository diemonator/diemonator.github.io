import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio/features/contacts/data/datasources/contacts_local_data_source.dart';
import 'package:portfolio/features/contacts/data/repositories/contacts_repository_impl.dart';
import 'package:portfolio/features/contacts/domain/models/contact_method.dart';
import 'package:portfolio/features/contacts/domain/models/social_link.dart';
import 'package:portfolio/features/contacts/domain/services/contacts_service_impl.dart';

void main() {
  late List<Uri> launched;
  late ContactsServiceImpl service;

  ContactsServiceImpl build({bool canLaunch = true}) {
    launched = [];

    return ContactsServiceImpl(
      const ContactsRepositoryImpl(ContactsLocalDataSource()),
      canLaunch: (uri) async => canLaunch,
      launch: (uri) async {
        launched.add(uri);

        return true;
      },
    );
  }

  setUp(() => service = build());

  test('exposes the contact methods and links from the data source', () {
    expect(service.contactMethods, hasLength(3));
    expect(service.socialLinks, hasLength(2));
  });

  test('builds a tel: uri for a phone row', () async {
    await service.open(
      const ContactMethod(
        icon: Icons.phone,
        action: ContactAction.tel,
        value: '+359 89 960 69 01',
      ),
    );

    expect(launched, [Uri(scheme: 'tel', path: '+359 89 960 69 01')]);
  });

  test('builds a mailto: uri for an email row', () async {
    await service.open(
      const ContactMethod(
        icon: Icons.mail,
        action: ContactAction.mailto,
        value: 'a@b.com',
      ),
    );

    expect(launched, [Uri(scheme: 'mailto', path: 'a@b.com')]);
  });

  // The address row is a plain fact, so tapping it must not open anything.
  test('opens nothing for a row with no action', () async {
    await service.open(
      ContactMethod(
        icon: Icons.location_pin,
        action: ContactAction.none,
        label: (l) => l.address,
      ),
    );

    expect(launched, isEmpty);
  });

  test('does not launch when the platform has no handler', () async {
    service = build(canLaunch: false);

    await service.openLink(
      const SocialLink(svgPath: 'x.svg', url: 'https://example.com'),
    );

    expect(launched, isEmpty);
  });
}
