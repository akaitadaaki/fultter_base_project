import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/sample_data.dart';
import '../../data/repository/sample_data_repository.dart';
import 'main_state.dart';

final mainViewModelProvider = StateNotifierProvider<MainViewModel, MainState>(
    (ref) => MainViewModel(ref, MainState(sampleList: ref.watch(sampleDataListProvider))));
final sampleDataListProvider =
    FutureProvider<List<SampleData>>((ref) async => ref.read(sampleDataRepositoryProvider).getSampleDataList());

class MainViewModel extends StateNotifier<MainState> {
  MainViewModel(this._ref, MainState state) : super(state);

  final Ref _ref;

  late final SampleDataReposiotory _sampleDataRepository = _ref.watch(sampleDataRepositoryProvider);

  // void setInputName(String inputName) => state = state.copyWith(inputName: inputName);
  // void setInputDescription(String inputDescription) => state = state.copyWith(inputDescription: inputDescription);

  Future<int> getLastId() async => await _sampleDataRepository.getLastId();

  Future<void> save(SampleData sampleData) async {
    // if (state.inputName.isNotEmpty) {
    // int lastId = await _sampleDataRepository.getLastId();
    _sampleDataRepository.saveSampleData(sampleData);
    // state = state.copyWith(inputName: "", inputDescription: "");
    // }
  }
}
