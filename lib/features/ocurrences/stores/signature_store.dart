import 'package:mobx/mobx.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences.dart';

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

  @computed
  bool get isValidResponsible {
    if (responsible.isEmpty) return false;
    if (responsible.length < 3 || responsible.length > 100) return false;
    return true;
  }

  @action
  void setResponsible(String responsible) {
    _ocurrenceStore.setResponsible(responsible);
  }
}
