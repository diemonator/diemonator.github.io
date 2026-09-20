import '../models/technology.dart';

abstract interface class HomeService {
  List<Technology> get technologies;

  List<Technology> get programmingLanguages;
}
