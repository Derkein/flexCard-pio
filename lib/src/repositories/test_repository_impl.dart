import 'package:flexcardapio/src/repositories/test_repository.dart';

import '../core/rest_client/custom_dio.dart';
import '../models/test_model.dart';

class TestRepositoryImpl implements TestRepository {
  final CustomDio dio;

  TestRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<TestModel>> all() async {
    final response = await dio.unauth().get('/cardapio');

    return response.data
        .map<TestModel>(
          (cardapio) => TestModel.fromMap(cardapio),
        )
        .toList();
  }
}
