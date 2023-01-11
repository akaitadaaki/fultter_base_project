import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/test_data.dart';
import '../../data/repository/test_data_repository.dart';

final subViewModelProvider =
    ChangeNotifierProvider.autoDispose.family<SubViewModel, int>((ref, id) => SubViewModel(ref, id));

class SubViewModel extends ChangeNotifier {
  SubViewModel(this._red, this._id);

  final Ref _red;
  final int _id;

  late final TestDataReposiotory _testDataRepository = _red.read(testDataRepositoryProvider);

  TestData? get data => _data;
  TestData? _data;

  Future<void> getTestData() async {
    _testDataRepository.getTestDataById(_id).then((value) => _data = value).whenComplete(notifyListeners);
  }
}
