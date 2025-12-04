import 'package:drift/drift.dart';
import 'package:transport_occurrence/core/db/db_connection.dart';
import 'package:transport_occurrence/data/models/ocurrence.dart';

extension OcurrencesTableDataExtension on OcurrencesTableData {
  Ocurrence toModel() {
    return Ocurrence(
      id: id,
      plate: plate,
      photosPath: photosPath.isNotEmpty
          ? photosPath.split(',').where((p) => p.isNotEmpty).toList()
          : [],
      responsible: responsible,
      signature: signature,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(updatedAt),
      isAlreadyProcessed: isAlreadyProcessed,
      isActived: isActived,
    );
  }
}

extension OcurrenceExtension on Ocurrence {
  OcurrencesTableCompanion toTableCompanion() {
    return OcurrencesTableCompanion(
      id: Value(id),
      plate: Value(plate),
      photosPath: Value(photosPath.join(',')),
      responsible: Value(responsible),
      signature: Value(signature),
      createdAt: Value(createdAt.millisecondsSinceEpoch),
      updatedAt: Value(updatedAt.millisecondsSinceEpoch),
      isAlreadyProcessed: Value(isAlreadyProcessed),
      isActived: Value(isActived),
    );
  }
}
