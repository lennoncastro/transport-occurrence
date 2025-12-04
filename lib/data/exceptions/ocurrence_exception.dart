import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocurrence_exception.freezed.dart';

@freezed
sealed class OcurrenceException with _$OcurrenceException implements Exception {
  const OcurrenceException._();

  const factory OcurrenceException.notFound({
    required String message,
    String? ocurrenceId,
    Object? originalException,
  }) = OcurrenceNotFoundException;

  const factory OcurrenceException.alreadyExists({
    required String message,
    String? ocurrenceId,
    Object? originalException,
  }) = OcurrenceAlreadyExistsException;

  const factory OcurrenceException.creationFailed({
    required String message,
    Object? originalException,
  }) = OcurrenceCreationException;

  const factory OcurrenceException.updateFailed({
    required String message,
    String? ocurrenceId,
    Object? originalException,
  }) = OcurrenceUpdateException;

  const factory OcurrenceException.queryFailed({
    required String message,
    Object? originalException,
  }) = OcurrenceQueryException;

  const factory OcurrenceException.syncFailed({
    required String message,
    String? ocurrenceId,
    Object? originalException,
  }) = OcurrenceSyncException;
}
