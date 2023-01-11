import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/test_data.dart';
import '../../data/repository/test_data_repository.dart';

final mainViewModelProvider = ChangeNotifierProvider((ref) => MainViewModel(ref));

class MainViewModel extends ChangeNotifier {
  MainViewModel(this._ref);

  final Ref _ref;

  late final TestDataReposiotory _testDataRepository = _ref.read(testDataRepositoryProvider);

  String inputName = "";
  String inputDescription = "";

  Future<List<TestData>> getDataList() async {
    return _testDataRepository.getTestDataList();
  }

  Future<void> save() async {
    if (inputName.isNotEmpty) {
      int lastId = await _testDataRepository.getLastId();
      _testDataRepository.saveTestData(
          TestData(id: ++lastId, name: inputName, description: inputDescription, lastUpdate: DateTime.now()));
      inputName = "";
      inputDescription = "";
      notifyListeners();
    }
  }
}
