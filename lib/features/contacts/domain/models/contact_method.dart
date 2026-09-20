import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../../../profile/domain/models/timeline_entry.dart' show LocalizedText;

/// How a contact row opens when tapped. [none] is a plain fact (an address).
enum ContactAction { none, tel, mailto }

final class ContactMethod extends Equatable {
  const ContactMethod({
    required this.icon,
    required this.action,
    this.value = '',
    this.label,
  }) : assert(
         value != '' || label != null,
         'a contact row needs either a literal value or a localized label',
       );

  final IconData icon;
  final ContactAction action;

  /// A literal like a phone number or email — never translated.
  final String value;

  /// Used instead of [value] when the text is localized copy.
  final LocalizedText? label;

  @override
  List<Object?> get props => [icon, action, value];
}
