import 'package:equatable/equatable.dart';

import '../../domain/models/contact_method.dart';
import '../../domain/models/social_link.dart';

class ContactsState extends Equatable {
  const ContactsState({this.methods = const [], this.links = const []});

  final List<ContactMethod> methods;
  final List<SocialLink> links;

  @override
  List<Object> get props => [methods, links];
}
