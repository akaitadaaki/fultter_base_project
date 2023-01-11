import 'package:fultter_base_project/data/db/test_data_database.dart';
import 'package:fultter_base_project/data/model/test_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final testDataRepositoryProvider = Provider((_) => TestDataReposiotoryImpl());

abstract class TestDataReposiotory {
  Future<List<TestData>> getTestDataList();
  Future<TestData?> getTestDataById(int id);
  Future<int> getLastId();
  Future<void> saveTestData(TestData data);
}

class TestDataReposiotoryImpl implements TestDataReposiotory {
  TestDataReposiotoryImpl();

  final _db = TestDataDatabase();

  @override
  Future<TestData?> getTestDataById(int id) async {
    return await _db.getTestDataById(id);
  }

  @override
  Future<List<TestData>> getTestDataList() async {
    return await _db.getTestDataList();
  }

  @override
  Future<void> saveTestData(TestData data) async {
    _db.insert(data);
  }

  @override
  Future<int> getLastId() async {
    return _db.getLastId();
  }
}
