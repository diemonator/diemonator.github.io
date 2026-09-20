import '../../domain/models/technology.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_local_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl(this._dataSource);

  final HomeLocalDataSource _dataSource;

  @override
  List<Technology> get technologies => _dataSource.getTechnologies();

  @override
  List<Technology> get programmingLanguages =>
      _dataSource.getProgrammingLanguages();
}
