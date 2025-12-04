import 'package:mobx/mobx.dart';
import 'package:transport_occurrence/features/ocurrences/stores/ocurrence_store.dart';

part 'signature_store.g.dart';

// ignore: library_private_types_in_public_api
class SignatureStore = _SignatureStoreBase with _$SignatureStore;

abstract class _SignatureStoreBase with Store {
  _SignatureStoreBase(this._ocurrenceStore);

  final OcurrenceStore _ocurrenceStore;

  @computed
  String get responsible => _ocurrenceStore.ocurrence.responsible;

  @computed
  String get signaturePath => _ocurrenceStore.ocurrence.signature;

  @computed
  bool get isButtonEnabled {
    return responsible.isNotEmpty && signaturePath.isNotEmpty;
  }

  @action
  void setResponsible(String responsible) {
    _ocurrenceStore.setResponsible(responsible);
  }
}
