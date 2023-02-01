import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/model/sample_data.dart';
import '../../data/repository/sample_data_repository.dart';
import 'sub_state.dart';

final subViewModelProvider =
    StateNotifierProvider.autoDispose.family<SubViewModel, SubState, int>((ref, id) => SubViewModel(ref, id));
final sampleDataProvider = FutureProvider.family<SampleData?, int>(
    (ref, id) async => ref.read(sampleDataRepositoryProvider).getSampleDataById(id));

class SubViewModel extends StateNotifier<SubState> {
  SubViewModel(this._ref, id) : super(SubState(id: id, data: _ref.watch(sampleDataProvider(id))));

  final Ref _ref;

  late final SampleDataReposiotory _sampleDataRepository = _ref.read(sampleDataRepositoryProvider);
}
