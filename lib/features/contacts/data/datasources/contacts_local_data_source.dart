import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/url_links.dart';
import '../../domain/models/contact_method.dart';
import '../../domain/models/social_link.dart';

const String phoneNumber = '+359 89 960 69 01';
const String email = 'e.k.karamihov@gmail.com';

/// Compiled-in contact details. ponytail: concrete, no interface — see
/// [HomeLocalDataSource].
class ContactsLocalDataSource {
  const ContactsLocalDataSource();

  List<ContactMethod> getContactMethods() => [
    ContactMethod(
      icon: Icons.location_pin,
      action: ContactAction.none,
      label: (l) => l.address,
    ),
    const ContactMethod(
      icon: Icons.phone,
      action: ContactAction.tel,
      value: phoneNumber,
    ),
    const ContactMethod(
      icon: Icons.mail,
      action: ContactAction.mailto,
      value: email,
    ),
  ];

  List<SocialLink> getSocialLinks() => const [
    SocialLink(svgPath: AppAssets.linkedin, url: UrlLinks.linkedIn),
    SocialLink(svgPath: AppAssets.github, url: UrlLinks.github),
  ];
}
