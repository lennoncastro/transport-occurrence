import 'package:mobx/mobx.dart';

part 'signature_store.g.dart';

// ignore: library_private_types_in_public_api
class SignatureStore = _SignatureStoreBase with _$SignatureStore;

abstract class _SignatureStoreBase with Store {
  @observable
  String responsible = '';

  @observable
  String signature = '';

  @computed
  bool get isButtonEnabled {
    return responsible.isNotEmpty && signature.isNotEmpty;
  }

  @action
  void setResponsible(String responsible) {
    this.responsible = responsible;
  }

  @action
  void setSignature(String signature) {
    this.signature = signature;
  }
}
