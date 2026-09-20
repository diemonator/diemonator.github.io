import '../models/technology.dart';

abstract interface class HomeRepository {
  List<Technology> get technologies;

  List<Technology> get programmingLanguages;
}
