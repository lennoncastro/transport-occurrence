import 'package:drift/drift.dart';

class OcurrencesTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get plate => text()();

  TextColumn get photosPath => text()();

  TextColumn get responsible => text()();

  TextColumn get signature => text()();

  IntColumn get createdAt => integer()();

  IntColumn get updatedAt => integer()();

  BoolColumn get isAlreadyProcessed => boolean()();

  BoolColumn get isActived => boolean()();
}
