import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/test_data.dart';
import '../../data/repository/test_data_repository.dart';
import 'sub_state.dart';

final subViewModelProvider =
    StateNotifierProvider.autoDispose.family<SubViewModel, SubState, int>((ref, id) => SubViewModel(ref, id));
final testDataProvider =
    FutureProvider.family<TestData?, int>((ref, id) async => ref.read(testDataRepositoryProvider).getTestDataById(id));

class SubViewModel extends StateNotifier<SubState> {
  SubViewModel(this._ref, id) : super(SubState(id: id, data: _ref.watch(testDataProvider(id))));

  final Ref _ref;

  late final TestDataReposiotory _testDataRepository = _ref.read(testDataRepositoryProvider);
}
