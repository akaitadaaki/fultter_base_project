import 'package:fultter_base_project/data/model/sample_data.dart';

final dummySampleData = SampleData(
    id: 1, name: "test name", description: "test description", lastUpdate: DateTime(2023, 2, 3, 4, 12, 34, 56, 78));

final dummySampleDataList = [
  dummySampleData,
  dummySampleData.copyWith(id: 2),
  dummySampleData.copyWith(id: 3),
  dummySampleData.copyWith(id: 4),
  dummySampleData.copyWith(id: 5),
];
