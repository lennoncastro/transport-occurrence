import 'package:mobx/mobx.dart';

part 'ocurrence_store.g.dart';

// ignore: library_private_types_in_public_api
class OcurrenceStore = _OcurrenceStoreBase with _$OcurrenceStore;

abstract class _OcurrenceStoreBase with Store {
  @observable
  String plate = '';

  @observable
  String photoPath = '';

  @computed
  bool get isValidPlate {
    final raw = plate.replaceAll('-', '').toUpperCase();
    final oldPattern = RegExp(r'^[A-Z]{3}[0-9]{4}$');
    final newPattern = RegExp(r'^[A-Z]{3}[0-9][A-Z][0-9]{2}$');
    return oldPattern.hasMatch(raw) || newPattern.hasMatch(raw);
  }

  @computed
  bool get isValidPhotoPath {
    return photoPath.isNotEmpty;
  }

  @computed
  bool get isButtonEnabled {
    return isValidPlate;
  }

  @action
  void setPlate(String plate) => this.plate = plate;

  @action
  void setPhotoPath(String photoPath) => this.photoPath = photoPath;
}
