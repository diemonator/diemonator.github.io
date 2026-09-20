import '../models/technology.dart';
import '../repositories/home_repository.dart';
import 'home_service.dart';

class HomeServiceImpl implements HomeService {
  const HomeServiceImpl(this._repository);

  final HomeRepository _repository;

  @override
  List<Technology> get technologies => _repository.technologies;

  @override
  List<Technology> get programmingLanguages => _repository.programmingLanguages;
}
