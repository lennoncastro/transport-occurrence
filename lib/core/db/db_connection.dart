import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:transport_occurrence/data/entities/ocurrence.dart';

part 'db_connection.g.dart';

@DriftDatabase(tables: [OcurrencesTable])
class DatabaseConnection extends _$DatabaseConnection {
  DatabaseConnection([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'sadamov_db',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
