import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/sample_data.dart';
import '../../data/repository/sample_data_repository.dart';
import 'main_state.dart';

final mainViewModelProvider = StateNotifierProvider<MainViewModel, MainState>((ref) =>
    MainViewModel(ref, MainState(inputName: "", inputDescription: "", sampleList: ref.watch(sampleDataListProvider))));
final sampleDataListProvider =
    FutureProvider<List<SampleData>>((ref) async => ref.read(sampleDataRepositoryProvider).getSampleDataList());

class MainViewModel extends StateNotifier<MainState> {
  MainViewModel(this._ref, MainState state) : super(state);

  final Ref _ref;

  late final SampleDataReposiotory _sampleDataRepository = _ref.read(sampleDataRepositoryProvider);

  void setImputName(String inputName) => state = state.copyWith(inputName: inputName);
  void setImputDescription(String inputDescription) => state = state.copyWith(inputDescription: inputDescription);

  Future<void> save() async {
    if (state.inputName.isNotEmpty) {
      int lastId = await _sampleDataRepository.getLastId();
      _sampleDataRepository.saveSampleData(SampleData(
          id: ++lastId, name: state.inputName, description: state.inputDescription, lastUpdate: DateTime.now()));
      state = state.copyWith(inputName: "", inputDescription: "");
    }
  }
}
