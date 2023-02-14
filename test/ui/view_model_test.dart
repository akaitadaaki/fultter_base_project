import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fultter_base_project/data/db/app_database.dart';
import 'package:fultter_base_project/data/db/sample_data_database.dart';
import 'package:fultter_base_project/data/model/sample_data.dart';
import 'package:fultter_base_project/data/repository/sample_data_repository.dart';
import 'package:fultter_base_project/ui/main/main_state.dart';
import 'package:fultter_base_project/ui/main/main_view_model.dart';
import 'package:fultter_base_project/ui/sub/sub_state.dart';
import 'package:fultter_base_project/ui/sub/sub_view_model.dart';
import 'package:mocktail/mocktail.dart';
import 'package:path/path.dart';

import '../data/dummy/dummy_sample_data.dart';
import '../data/repository/fake_sample_data_repository_impl.dart';

class MockSampleDataDatabase extends Mock implements SampleDataDatabase {}

//後で外だし？
class ProviderListener<T> extends Mock {
  void call(T? previous, T? next);
}

void main() {
  group('main', () {
    test('SampleDataListProvider Test', () async {
      final container = ProviderContainer(overrides: [
        sampleDataRepositoryProvider.overrideWith((ref) => FakeSampleDataRepositoryImpl()),
      ]);

      expect(
        container.read(sampleDataListProvider),
        const AsyncValue<List<SampleData>>.loading(),
      );

      await Future<void>.value();

      expect(container.read(sampleDataListProvider).asData?.value, [
        isA<SampleData>()
            .having((data) => data.id, 'id', dummySampleDataList[0].id)
            .having((data) => data.name, 'name', dummySampleDataList[0].name)
            .having((data) => data.description, 'description', dummySampleDataList[0].description)
            .having((data) => data.lastUpdate, 'lastUpdate', dummySampleDataList[0].lastUpdate),
        isA().having((data) => data.id, 'id', dummySampleDataList[1].id),
        isA().having((data) => data.id, 'id', dummySampleDataList[2].id),
        isA().having((data) => data.id, 'id', dummySampleDataList[3].id),
        isA().having((data) => data.id, 'id', dummySampleDataList[4].id),
      ]);
    });
    test('SampleDataReposiotory Test', () async {
      final mockSampleDataDatabase = MockSampleDataDatabase();

      var container = ProviderContainer(overrides: [
        sampleDatabaseProvider.overrideWith((ref) => mockSampleDataDatabase),
      ]);
      when(mockSampleDataDatabase.getSampleDataList).thenAnswer((_) => Future.value(dummySampleDataList));
      final repository = container.read(sampleDataRepositoryProvider);

      expect(await repository.getSampleDataList(), dummySampleDataList);

      when(() => mockSampleDataDatabase.getSampleDataById(any())).thenAnswer((_) => Future.value(dummySampleData));
      expect(await repository.getSampleDataById(1), dummySampleData);
      when(() => mockSampleDataDatabase.getSampleDataById(any()))
          .thenAnswer((_) => Future.value(dummySampleData.copyWith(id: 2)));
      expect(
          await repository.getSampleDataById(2),
          isA<SampleData>()
              .having((data) => data.id, 'id', 2)
              .having((data) => data.name, 'name', dummySampleData.name)
              .having((data) => data.description, 'description', dummySampleData.description)
              .having((data) => data.lastUpdate, 'lastUpdate', dummySampleData.lastUpdate));

      when(() => mockSampleDataDatabase.insert(dummySampleData)).thenAnswer((_) => Future.value(dummySampleData));
      expect(await repository.saveSampleData(dummySampleData), dummySampleData);

      when(() => mockSampleDataDatabase.getLastId()).thenAnswer((_) => Future.value(2));
      expect(await repository.getLastId(), 2);
    });
    test('MainViewModel Test', () async {
      final container = ProviderContainer(overrides: [
        sampleDataRepositoryProvider.overrideWith((ref) => FakeSampleDataRepositoryImpl()),
      ]);
      final listener = ProviderListener<MainState>();

      // // 状態の監視
      var subscription = container.listen(
        mainViewModelProvider,
        listener,
        fireImmediately: true,
      );

      await Future<void>.value();
      subscription.read();

      verifyInOrder([
        () => listener.call(null, MainState(sampleList: const AsyncValue.loading())),
        () => listener.call(MainState(sampleList: const AsyncValue.loading()),
            MainState(sampleList: AsyncValue.data(dummySampleDataList))),
      ]);

      final viewModel = container.read(mainViewModelProvider.notifier);
      expect(await viewModel.getLastId(), 1);
    });
  });
  group('sub', () {
    test('SampleDataProvider Test', () async {
      final container = ProviderContainer(overrides: [
        sampleDataRepositoryProvider.overrideWith((ref) => FakeSampleDataRepositoryImpl()),
      ]);

      expect(
        container.read(sampleDataProvider(1)),
        const AsyncValue<SampleData?>.loading(),
      );

      await Future<void>.value();

      expect(
          container.read(sampleDataProvider(1)).asData?.value,
          isA<SampleData>()
              .having((data) => data.id, 'id', dummySampleData.id)
              .having((data) => data.name, 'name', dummySampleData.name)
              .having((data) => data.description, 'description', dummySampleData.description)
              .having((data) => data.lastUpdate, 'lastUpdate', dummySampleData.lastUpdate));
    });
    test('SubViewModel Test', () async {
      final container = ProviderContainer(overrides: [
        sampleDataRepositoryProvider.overrideWith((ref) => FakeSampleDataRepositoryImpl()),
      ]);
      final listener = ProviderListener<SubState>();

      // // 状態の監視
      var subscription = container.listen(
        subViewModelProvider(1),
        listener,
        fireImmediately: true,
      );

      await Future<void>.value();
      subscription.read();

      verifyInOrder([
        () => listener.call(null, SubState(id: 1, data: const AsyncValue.loading())),
        () => listener.call(
            SubState(id: 1, data: const AsyncValue.loading()), SubState(id: 1, data: AsyncValue.data(dummySampleData))),
      ]);
    });
  });
  group('SampleDataDatabase', () {
    late ProviderContainer container;
    setUp(() async {
      container = ProviderContainer(overrides: [
        testDatabasePathProvider.overrideWith((ref) => join('assets', databaseFileName)),
      ]);
    });

    test('SampleDataDatabase Test', () async {
      final sampleDataDatabase = container.read(sampleDatabaseProvider);

      final time = DateTime.fromMillisecondsSinceEpoch((DateTime.now().millisecondsSinceEpoch ~/ 1000 * 1000));
      final inserted = await sampleDataDatabase.insert(dummySampleData.copyWith(lastUpdate: time));
      expect(
          inserted,
          isA<SampleData>()
              .having((data) => data.id, 'id', dummySampleData.id)
              .having((data) => data.name, 'name', dummySampleData.name)
              .having((data) => data.description, 'description', dummySampleData.description)
              .having((data) => data.lastUpdate, 'lastUpdate', time));
      await sampleDataDatabase.insert(dummySampleData.copyWith(id: 2, lastUpdate: time));
      await sampleDataDatabase.insert(dummySampleData.copyWith(id: 3));
      await sampleDataDatabase.insert(dummySampleData.copyWith(id: 4));
      final list = await sampleDataDatabase.getSampleDataList();
      expect(list, [
        isA<SampleData>()
            .having((data) => data.id, 'id', dummySampleData.id)
            .having((data) => data.name, 'name', dummySampleData.name)
            .having((data) => data.description, 'description', dummySampleData.description)
            .having((data) => data.lastUpdate, 'lastUpdate', time),
        isA<SampleData>().having((data) => data.id, 'id', 2).having((data) => data.lastUpdate, 'lastUpdate', time),
        isA<SampleData>().having((data) => data.id, 'id', 3),
        isA<SampleData>().having((data) => data.id, 'id', 4)
      ]);
      final updated = await sampleDataDatabase.update(dummySampleData.copyWith(id: 3, lastUpdate: time));
      expect(updated, 1);
      final id3 = await sampleDataDatabase.getSampleDataById(3);
      expect(
          id3,
          isA<SampleData>()
              .having((data) => data.id, 'id', 3)
              .having((data) => data.name, 'name', dummySampleData.name)
              .having((data) => data.description, 'description', dummySampleData.description)
              .having((data) => data.lastUpdate, 'lastUpdate', time));
      final lastId = await sampleDataDatabase.getLastId();
      expect(lastId, 4);
      final deleted = await sampleDataDatabase.delete(4);
      expect(deleted, 1);
      final lastId2 = await sampleDataDatabase.getLastId();
      expect(lastId2, 3);
      final deletedAll = await sampleDataDatabase.deleteAll();
      expect(deletedAll, 3);
      final lastId3 = await sampleDataDatabase.getLastId();
      expect(lastId3, 0);
    });
  });
}
