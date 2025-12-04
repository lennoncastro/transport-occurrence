import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_store.dart';
import 'package:transport_occurrence/features/ocurrences/stores/signature_store.dart';

class SignatureViewModel {
  SignatureViewModel(
    this._ocurrenceStore,
    this._signatureStore,
    this._navigationService,
  );

  final OcurrenceStore _ocurrenceStore;

  final SignatureStore _signatureStore;

  final NavigationService _navigationService;

  void submit() {
    if (!_signatureStore.isButtonEnabled) return;
    _ocurrenceStore
      ..setResponsible(_signatureStore.responsible)
      ..setSignature(_signatureStore.signature);
    _navigationService.goToOccurrenceSuccess();
  }

  void takeSignature() {
    _navigationService.goToManualSignature();
  }
}
