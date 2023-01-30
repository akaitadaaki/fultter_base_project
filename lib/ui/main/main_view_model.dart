import 'package:fultter_base_project/data/model/test_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/test_data.dart';
import '../../data/repository/test_data_repository.dart';

final mainViewModelProvider = StateNotifierProvider<MainViewModel, TestState>((ref) => MainViewModel(ref));
final testDataProvider =
    FutureProvider<List<TestData>>((ref) async => ref.read(testDataRepositoryProvider).getTestDataList());

class MainViewModel extends StateNotifier<TestState> {
  MainViewModel(this._ref) : super(TestState(inputName: "", inputDescription: ""));

  final Ref _ref;

  late final TestDataReposiotory _testDataRepository = _ref.read(testDataRepositoryProvider);

  void setImputName(String inputName) => state = state.copyWith(inputName: inputName);
  void setImputDescription(String inputDescription) => state = state.copyWith(inputDescription: inputDescription);

  Future<void> save() async {
    if (state.inputName.isNotEmpty) {
      int lastId = await _testDataRepository.getLastId();
      _testDataRepository.saveTestData(TestData(
          id: ++lastId, name: state.inputName, description: state.inputDescription, lastUpdate: DateTime.now()));
      state = TestState(inputName: "", inputDescription: "");
    }
  }
}
