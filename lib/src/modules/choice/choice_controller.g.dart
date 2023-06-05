// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChoiceController on ChoiceControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ChoiceControllerBase._status', context: context);

  ChoiceStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ChoiceStateStatus get _status => status;

  @override
  set _status(ChoiceStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_choiceTypesAtom =
      Atom(name: 'ChoiceControllerBase._choiceTypes', context: context);

  List<TestModel> get choiceTypes {
    _$_choiceTypesAtom.reportRead();
    return super._choiceTypes;
  }

  @override
  List<TestModel> get _choiceTypes => choiceTypes;

  @override
  set _choiceTypes(List<TestModel> value) {
    _$_choiceTypesAtom.reportWrite(value, super._choiceTypes, () {
      super._choiceTypes = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'ChoiceControllerBase._errorMessage', context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$loadChoicesAsyncAction =
      AsyncAction('ChoiceControllerBase.loadChoices', context: context);

  @override
  Future<void> loadChoices() {
    return _$loadChoicesAsyncAction.run(() => super.loadChoices());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
