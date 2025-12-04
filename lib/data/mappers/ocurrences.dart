import 'package:drift/drift.dart';
import 'package:transport_occurrence/core/core.dart';
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

  Future<Map<String, dynamic>> toHttpJson() async {
    final json = toJson();
    final photosFutures = photosPath
        .where((path) => path.isNotEmpty)
        .map((photoPath) => photoPath.readAsBase64())
        .toList();
    final allFutures = <Future<String?>>[
      ...photosFutures,
      if (signature.isNotEmpty) signature.readAsBase64(),
    ];
    final results = await Future.wait(allFutures);
    final photosBase64 = results
        .take(photosFutures.length)
        .whereType<String>()
        .toList();
    final signatureBase64 =
        signature.isNotEmpty && results.length > photosFutures.length
        ? results.last
        : null;
    final body = Map<String, dynamic>.from(json);
    body.remove('photosPath');
    body.remove('signature');
    body['photos'] = photosBase64;
    body['signature'] = signatureBase64 ?? '';
    return body;
  }
}
