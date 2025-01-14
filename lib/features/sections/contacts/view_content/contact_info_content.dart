import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/extensions/language_extensions.dart';
import '../models/contact_info.dart';

const phoneNumber = '+359 89 960 69 01';
const email = 'e.k.karamihov@gmail.com';

extension ContactInfoContent on ContactInfo {
  static List<ContactInfo> of(BuildContext context) {
    return [
      ContactInfo(
        icon: Icons.location_pin,
        text: context.appLocalizations.address,
      ),
      const ContactInfo(
        icon: Icons.phone,
        text: phoneNumber,
        onTap: _tel,
      ),
      const ContactInfo(
        icon: Icons.mail,
        text: email,
        onTap: _mailTo,
      ),
    ];
  }
}

Future<void> _mailTo() async {
  final uri = Uri(scheme: 'mailto', path: email);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Future<void> _tel() async {
  final uri = Uri(scheme: 'tel', path: phoneNumber);

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}
