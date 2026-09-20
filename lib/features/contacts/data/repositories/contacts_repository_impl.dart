import '../../domain/models/contact_method.dart';
import '../../domain/models/social_link.dart';
import '../../domain/repositories/contacts_repository.dart';
import '../datasources/contacts_local_data_source.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  const ContactsRepositoryImpl(this._dataSource);

  final ContactsLocalDataSource _dataSource;

  @override
  List<ContactMethod> get contactMethods => _dataSource.getContactMethods();

  @override
  List<SocialLink> get socialLinks => _dataSource.getSocialLinks();
}
