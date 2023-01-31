import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/test_data.dart';
import '../../data/repository/test_data_repository.dart';
import 'main_state.dart';

final mainViewModelProvider = StateNotifierProvider<MainViewModel, MainState>((ref) => MainViewModel(ref));
final testDataListProvider =
    FutureProvider<List<TestData>>((ref) async => ref.read(testDataRepositoryProvider).getTestDataList());

class MainViewModel extends StateNotifier<MainState> {
  MainViewModel(this._ref)
      : super(MainState(inputName: "", inputDescription: "", testList: _ref.watch(testDataListProvider)));

  final Ref _ref;

  late final TestDataReposiotory _testDataRepository = _ref.read(testDataRepositoryProvider);

  void setImputName(String inputName) => state = state.copyWith(inputName: inputName);
  void setImputDescription(String inputDescription) => state = state.copyWith(inputDescription: inputDescription);

  Future<void> save() async {
    if (state.inputName.isNotEmpty) {
      int lastId = await _testDataRepository.getLastId();
      _testDataRepository.saveTestData(TestData(
          id: ++lastId, name: state.inputName, description: state.inputDescription, lastUpdate: DateTime.now()));
      state = state.copyWith(inputName: "", inputDescription: "");
    }
  }
}
