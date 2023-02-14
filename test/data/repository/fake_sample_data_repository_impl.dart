import 'package:fultter_base_project/data/model/sample_data.dart';
import 'package:fultter_base_project/data/repository/sample_data_repository.dart';
import 'package:riverpod/src/framework.dart';

import '../dummy/dummy_sample_data.dart';

class FakeSampleDataRepositoryImpl implements SampleDataReposiotoryImpl {
  @override
  Future<int> getLastId() async {
    return 1;
  }

  @override
  Future<SampleData?> getSampleDataById(int id) async {
    if (id == 1) {
      return dummySampleData;
    } else if (id == 2) {
      return dummySampleData.copyWith(id: 2);
    } else {
      return null;
    }
  }

  @override
  Future<List<SampleData>> getSampleDataList() async => dummySampleDataList;

  @override
  Future<SampleData> saveSampleData(SampleData data) async => dummySampleData;

  @override
  void init() {}
}
