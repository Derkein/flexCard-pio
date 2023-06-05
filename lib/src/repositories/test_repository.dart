import 'package:flexcardapio/src/models/test_model.dart';

abstract class TestRepository {
  Future<List<TestModel>> all();
}
