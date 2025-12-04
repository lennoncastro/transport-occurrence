import 'package:mobx/mobx.dart';
import 'package:transport_occurrence/core/extensions/extensions.dart';
import 'package:transport_occurrence/features/ocurrences/ocurrences.dart';

part 'success_store.g.dart';

// ignore: library_private_types_in_public_api
class SuccessStore = _SuccessStoreBase with _$SuccessStore;

abstract class _SuccessStoreBase with Store {
  _SuccessStoreBase(this._ocurrenceStore);

  final OcurrenceStore _ocurrenceStore;

  @computed
  String get plate {
    final purePlate = _ocurrenceStore.ocurrence.plate;
    final firstPart = purePlate.substring(0, 3);
    final secondPart = purePlate.substring(3, 7);
    return '$firstPart-$secondPart';
  }

  @computed
  String get responsible => _ocurrenceStore.ocurrence.responsible;

  @computed
  DateTime get createdAt => _ocurrenceStore.ocurrence.createdAt;

  @computed
  String get formattedDate => createdAt.toFormattedDate();

  @computed
  String get formattedTime => createdAt.toFormattedTime();
}
