import 'package:transport_occurrence/core/db/db.dart';
import 'package:transport_occurrence/core/db/exceptions/database_exception.dart';
import 'package:transport_occurrence/data/data.dart';

abstract interface class OcurrenceRepository {
  Future<void> create(Ocurrence ocurrence);

  Future<void> markAsProcessed(String id);

  Future<List<Ocurrence>> findNotProcessed();

  Future<Ocurrence> findById(String id);
}

class OcurrenceRepositoryImpl implements OcurrenceRepository {
  OcurrenceRepositoryImpl(this._ocurrenceDao);

  final OcurrenceDao _ocurrenceDao;

  @override
  Future<void> create(Ocurrence ocurrence) async {
    try {
      await _ocurrenceDao.insert(ocurrence);
    } on DatabaseException catch (e) {
      e.when(
        notFound: (message, originalException) {
          throw OcurrenceException.notFound(
            message: message,
            originalException: originalException,
          );
        },
        constraint: (message, originalException) {
          throw OcurrenceException.alreadyExists(
            message: message,
            ocurrenceId: ocurrence.id,
            originalException: originalException,
          );
        },
        operation: (message, originalException) {
          throw OcurrenceException.creationFailed(
            message: message,
            originalException: originalException,
          );
        },
      );
    } catch (e) {
      throw OcurrenceException.creationFailed(
        message: 'Erro inesperado ao criar ocorrência',
        originalException: e,
      );
    }
  }

  @override
  Future<void> markAsProcessed(String id) async {
    try {
      final updated = await _ocurrenceDao.markAsProcessed(id);
      if (!updated) {
        throw OcurrenceException.notFound(
          message: 'Ocorrência não encontrada',
          ocurrenceId: id,
        );
      }
    } on DatabaseException catch (e) {
      e.when(
        notFound: (message, originalException) {
          throw OcurrenceException.notFound(
            message: message,
            ocurrenceId: id,
            originalException: originalException,
          );
        },
        constraint: (message, originalException) {
          throw OcurrenceException.updateFailed(
            message: message,
            ocurrenceId: id,
            originalException: originalException,
          );
        },
        operation: (message, originalException) {
          throw OcurrenceException.updateFailed(
            message: message,
            ocurrenceId: id,
            originalException: originalException,
          );
        },
      );
    } catch (e) {
      if (e is OcurrenceException) rethrow;
      throw OcurrenceException.updateFailed(
        message: 'Erro inesperado ao marcar ocorrência como processada',
        ocurrenceId: id,
        originalException: e,
      );
    }
  }

  @override
  Future<List<Ocurrence>> findNotProcessed() async {
    try {
      return await _ocurrenceDao.findNotProcessed();
    } on DatabaseException catch (e) {
      e.when(
        notFound: (message, originalException) {
          throw OcurrenceException.queryFailed(
            message: message,
            originalException: originalException,
          );
        },
        constraint: (message, originalException) {
          throw OcurrenceException.queryFailed(
            message: message,
            originalException: originalException,
          );
        },
        operation: (message, originalException) {
          throw OcurrenceException.queryFailed(
            message: message,
            originalException: originalException,
          );
        },
      );
    } catch (e) {
      throw OcurrenceException.queryFailed(
        message: 'Erro inesperado ao buscar ocorrências não processadas',
        originalException: e,
      );
    }
  }

  @override
  Future<Ocurrence> findById(String id) async {
    try {
      final ocurrence = await _ocurrenceDao.findById(id);
      if (ocurrence == null) {
        throw OcurrenceException.notFound(
          message: 'Ocorrência não encontrada',
          ocurrenceId: id,
        );
      }
      return ocurrence;
    } on DatabaseException catch (e) {
      e.when(
        notFound: (message, originalException) {
          throw OcurrenceException.notFound(
            message: message,
            ocurrenceId: id,
            originalException: originalException,
          );
        },
        constraint: (message, originalException) {
          throw OcurrenceException.queryFailed(
            message: message,
            originalException: originalException,
          );
        },
        operation: (message, originalException) {
          throw OcurrenceException.queryFailed(
            message: message,
            originalException: originalException,
          );
        },
      );
    } catch (e) {
      if (e is OcurrenceException) rethrow;
      throw OcurrenceException.queryFailed(
        message: 'Erro inesperado ao buscar ocorrência',
        originalException: e,
      );
    }
  }
}
