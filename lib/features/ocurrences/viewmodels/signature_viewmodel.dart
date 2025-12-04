import 'package:transport_occurrence/core/navigation/navigator_service.dart';
import 'package:transport_occurrence/data/repositories/ocurrence_repository.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_store.dart';
import 'package:transport_occurrence/features/ocurrences/stores/signature_store.dart';

class SignatureViewModel {
  SignatureViewModel(
    this._ocurrenceStore,
    this._signatureStore,
    this._navigationService,
    this._ocurrenceRepository,
  );

  final OcurrenceStore _ocurrenceStore;

  final SignatureStore _signatureStore;

  final NavigationService _navigationService;

  final OcurrenceRepository _ocurrenceRepository;

  void submit() async {
    if (!_signatureStore.isButtonEnabled) return;
    _ocurrenceStore
      ..setResponsible(_signatureStore.responsible)
      ..setSignaturePath(_signatureStore.signaturePath);
    try {
      await _ocurrenceRepository.create(_ocurrenceStore.ocurrence);
      _navigationService.goToOccurrenceSuccess();
    } catch (_) {
      // do nothing by now
    }
  }

  void takeSignature() {
    _navigationService.goToManualSignature();
  }
}
