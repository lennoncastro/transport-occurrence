import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_store.dart';

class OcurrenceViewModel {
  OcurrenceViewModel(this._store, this._navigationService);

  final OcurrenceStore _store;

  final NavigationService _navigationService;

  void submit() {
    if (!_store.isButtonEnabled) return;
    _navigationService.goToSignature();
  }

  void takePhoto() {}
}
