import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/test_model.dart';
import '../../repositories/test_repository.dart';
part 'choice_controller.g.dart';

enum ChoiceStateStatus {
  initial,
  loading,
  laoded,
  error,
}

class ChoiceController = ChoiceControllerBase with _$ChoiceController;

abstract class ChoiceControllerBase with Store {
  final TestRepository _testRepository;

  @readonly
  // ignore: unused_field
  var _status = ChoiceStateStatus.initial;

  @readonly
  // ignore: unused_field
  var _choiceTypes = <TestModel>[];

  @readonly
  // ignore: unused_field
  String? _errorMessage;

  ChoiceControllerBase(this._testRepository);

  @action
  Future<void> loadChoices() async {
    try {
      _status = ChoiceStateStatus.loading;
      _choiceTypes = await _testRepository.all();
      _status = ChoiceStateStatus.laoded;
    } catch (e, s) {
      log('Erro dos sites', error: e, stackTrace: s);
      _status = ChoiceStateStatus.error;
      _errorMessage = 'Erro dos sites';
    }
  }
}
