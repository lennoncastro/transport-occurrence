import 'package:mobx/mobx.dart';
import 'package:transport_occurrence/data/data.dart';

part 'ocurrence_store.g.dart';

// ignore: library_private_types_in_public_api
class OcurrenceStore = _OcurrenceStoreBase with _$OcurrenceStore;

abstract class _OcurrenceStoreBase with Store {
  Ocurrence ocurrence = Ocurrence.empty();

  @action
  void setPlate(String plate) {
    ocurrence = ocurrence.copyWith(plate: plate);
  }

  @action
  void setPhotoPath(String photoPath) {
    ocurrence = ocurrence.copyWith(
      photosPath: [...ocurrence.photosPath, photoPath],
    );
  }

  @action
  void setResponsible(String responsible) {
    ocurrence = ocurrence.copyWith(responsible: responsible);
  }

  @action
  void setSignature(String signature) {
    ocurrence = ocurrence.copyWith(signature: signature);
  }
}
