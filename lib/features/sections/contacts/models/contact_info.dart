import 'package:flutter/widgets.dart';

final class ContactInfo {
  const ContactInfo({
    required this.icon,
    required this.text,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;
}
