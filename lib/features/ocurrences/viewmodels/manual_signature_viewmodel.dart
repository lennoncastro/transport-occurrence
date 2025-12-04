import 'package:flutter/services.dart';
import 'package:transport_occurrence/core/navigation/navigation.dart';
import 'package:transport_occurrence/core/signature/signature.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences.dart';

class ManualSignatureViewModel {
  ManualSignatureViewModel(
    this._ocurrenceStore,
    this._manualSignatureStore,
    this._navigationService,
    this._signatureProvider,
  );

  final OcurrenceStore _ocurrenceStore;

  final ManualSignatureStore _manualSignatureStore;

  final NavigationService _navigationService;

  final SignatureProvider _signatureProvider;

  void submit() {
    if (!_manualSignatureStore.isButtonEnabled) return;
    _ocurrenceStore.setSignaturePath(_manualSignatureStore.signaturePath);
    _navigationService.back();
  }

  void setSignature(Uint8List? signatureBytes) async {
    try {
      if (signatureBytes == null || signatureBytes.isEmpty) return;
      final signaturePath = await _signatureProvider.saveSignature(
        signatureBytes,
      );
      if (signaturePath == null) return;
      _manualSignatureStore.setSignature(signaturePath);
      _ocurrenceStore.setSignaturePath(signaturePath);
    } catch (_) {
      // do nothing by now
    }
  }
}
