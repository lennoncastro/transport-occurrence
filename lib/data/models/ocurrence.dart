import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocurrence.freezed.dart';

@freezed
abstract class Ocurrence with _$Ocurrence {
  const factory Ocurrence({
    required String plate,
    required List<String> photosPath,
    required String responsible,
    required String signature,
    required DateTime createdAt,
    required DateTime updatedAt,
    required bool isAlreadyProcessed,
    required bool isActived,
  }) = _Ocurrence;
}
