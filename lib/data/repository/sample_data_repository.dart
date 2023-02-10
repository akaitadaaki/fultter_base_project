import 'package:fultter_base_project/data/db/sample_data_database.dart';
import 'package:fultter_base_project/data/model/sample_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sampleDataRepositoryProvider = Provider((ref) => SampleDataReposiotoryImpl(ref));

abstract class SampleDataReposiotory {
  Future<List<SampleData>> getSampleDataList();
  Future<SampleData?> getSampleDataById(int id);
  Future<int> getLastId();
  Future<void> saveSampleData(SampleData data);
}

class SampleDataReposiotoryImpl implements SampleDataReposiotory {
  SampleDataReposiotoryImpl(this._ref);

  final Ref _ref;
  late final SampleDataDatabase _db = _ref.watch(sampleDatabaseProvider);

  @override
  Future<SampleData?> getSampleDataById(int id) async {
    return await _db.getSampleDataById(id);
  }

  @override
  Future<List<SampleData>> getSampleDataList() async {
    return await _db.getSampleDataList();
  }

  @override
  Future<void> saveSampleData(SampleData data) async {
    _db.insert(data);
  }

  @override
  Future<int> getLastId() async {
    return _db.getLastId();
  }
}
