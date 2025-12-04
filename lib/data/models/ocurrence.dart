import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'ocurrence.freezed.dart';
part 'ocurrence.g.dart';

@freezed
abstract class Ocurrence with _$Ocurrence {
  const Ocurrence._();

  const factory Ocurrence({
    @Default('') String id,
    required String plate,
    required List<String> photosPath,
    required String responsible,
    required String signature,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
    @JsonKey(name: 'updatedAt') required DateTime updatedAt,
    @JsonKey(name: 'isAlreadyProcessed') required bool isAlreadyProcessed,
    @JsonKey(name: 'isActived') required bool isActived,
  }) = _Ocurrence;

  factory Ocurrence.fromJson(Map<String, dynamic> json) =>
      _$OcurrenceFromJson(json);

  factory Ocurrence.create({
    required String plate,
    required List<String> photosPath,
    required String responsible,
    required String signature,
  }) {
    final now = DateTime.now();
    return Ocurrence(
      id: _uuid.v4(),
      plate: plate,
      photosPath: photosPath,
      responsible: responsible,
      signature: signature,
      createdAt: now,
      updatedAt: now,
      isAlreadyProcessed: false,
      isActived: true,
    );
  }

  factory Ocurrence.empty() {
    final now = DateTime.now();
    return Ocurrence(
      id: _uuid.v4(),
      plate: '',
      photosPath: [],
      responsible: '',
      signature: '',
      createdAt: now,
      updatedAt: now,
      isAlreadyProcessed: false,
      isActived: true,
    );
  }

  static final Uuid _uuid = Uuid();
}
