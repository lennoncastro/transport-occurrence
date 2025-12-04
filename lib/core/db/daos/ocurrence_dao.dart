import 'package:drift/drift.dart' hide DatabaseConnection;
import 'package:drift/native.dart';
import 'package:transport_occurrence/core/db/db_connection.dart';
import 'package:transport_occurrence/core/db/exceptions/database_exception.dart';
import 'package:transport_occurrence/data/mappers/ocurrences.dart';
import 'package:transport_occurrence/data/models/ocurrence.dart';

class OcurrenceDao {
  OcurrenceDao(this._db);

  final DatabaseConnection _db;

  Future<void> insert(Ocurrence ocurrence) async {
    try {
      await _db.into(_db.ocurrencesTable).insert(ocurrence.toTableCompanion());
    } on SqliteException catch (e) {
      final message = e.message;
      if (message.contains('UNIQUE constraint')) {
        throw DatabaseException.constraint(
          message: 'Já existe uma ocorrência com este ID',
          originalException: e,
        );
      }
      throw DatabaseException.operation(
        message:
            'Erro ao inserir ocorrência: ${message.isNotEmpty ? message : "Erro desconhecido"}',
        originalException: e,
      );
    } catch (e) {
      throw DatabaseException.operation(
        message: 'Erro inesperado ao inserir ocorrência',
        originalException: e,
      );
    }
  }

  Future<Ocurrence?> findById(String id) async {
    try {
      final result = await (_db.select(
        _db.ocurrencesTable,
      )..where((t) => t.id.equals(id))).getSingleOrNull();
      if (result == null) return null;
      return result.toModel();
    } on SqliteException catch (e) {
      throw DatabaseException.operation(
        message: 'Erro ao buscar ocorrência: ${e.message}',
        originalException: e,
      );
    } catch (e) {
      throw DatabaseException.operation(
        message: 'Erro inesperado ao buscar ocorrência',
        originalException: e,
      );
    }
  }

  Future<List<Ocurrence>> findNotProcessed() async {
    try {
      final results = await (_db.select(
        _db.ocurrencesTable,
      )..where((t) => t.isAlreadyProcessed.equals(false))).get();
      return results.map((data) => data.toModel()).toList();
    } on SqliteException catch (e) {
      throw DatabaseException.operation(
        message: 'Erro ao buscar ocorrências não processadas: ${e.message}',
        originalException: e,
      );
    } catch (e) {
      throw DatabaseException.operation(
        message: 'Erro inesperado ao buscar ocorrências não processadas',
        originalException: e,
      );
    }
  }

  Future<bool> markAsProcessed(String id) async {
    try {
      final updated =
          await (_db.update(
            _db.ocurrencesTable,
          )..where((t) => t.id.equals(id))).write(
            OcurrencesTableCompanion(
              isAlreadyProcessed: const Value(true),
              updatedAt: Value(DateTime.now().millisecondsSinceEpoch),
            ),
          );
      return updated > 0;
    } on SqliteException catch (e) {
      throw DatabaseException.operation(
        message: 'Erro ao marcar ocorrência como processada: ${e.message}',
        originalException: e,
      );
    } catch (e) {
      throw DatabaseException.operation(
        message: 'Erro inesperado ao marcar ocorrência como processada',
        originalException: e,
      );
    }
  }

  Future<int> countNotProcessedAndActive() async {
    try {
      final result =
          await (_db.selectOnly(_db.ocurrencesTable)
                ..addColumns([_db.ocurrencesTable.id.count()])
                ..where(
                  _db.ocurrencesTable.isAlreadyProcessed.equals(false) &
                      _db.ocurrencesTable.isActived.equals(true),
                ))
              .getSingle();
      return result.read(_db.ocurrencesTable.id.count()) ?? 0;
    } on SqliteException catch (e) {
      throw DatabaseException.operation(
        message: 'Erro ao contar ocorrências: ${e.message}',
        originalException: e,
      );
    } catch (e) {
      throw DatabaseException.operation(
        message: 'Erro inesperado ao contar ocorrências',
        originalException: e,
      );
    }
  }
}
