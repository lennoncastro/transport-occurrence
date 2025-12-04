import 'package:mobx/mobx.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences.dart';

part 'manual_signature_store.g.dart';

// ignore: library_private_types_in_public_api
class ManualSignatureStore = _ManualSignatureStoreBase
    with _$ManualSignatureStore;

abstract class _ManualSignatureStoreBase with Store {
  _ManualSignatureStoreBase(this._ocurrenceStore);

  final OcurrenceStore _ocurrenceStore;

  @computed
  String get signaturePath => _ocurrenceStore.ocurrence.signature;

  @computed
  bool get isButtonEnabled {
    return signaturePath.isNotEmpty;
  }

  @action
  void setSignature(String signaturePath) {
    _ocurrenceStore.setSignaturePath(signaturePath);
  }
}
