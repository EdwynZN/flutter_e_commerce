import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_provider.g.dart';

@riverpod
class FilterNotifier extends AutoDisposeNotifier<String> {
  /// getter to get state from class without listen to the actual value
  String get initial => state;

  @override
  String build() => '';

  void changeSearch(String newValue) {
    if (newValue == state) {
      return;
    }
    state = newValue;
  }
}
