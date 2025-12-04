import 'package:freezed_annotation/freezed_annotation.dart';

part 'database_exception.freezed.dart';

@freezed
sealed class DatabaseException with _$DatabaseException implements Exception {
  const DatabaseException._();

  const factory DatabaseException.notFound({
    required String message,
    Object? originalException,
  }) = DatabaseNotFoundException;

  const factory DatabaseException.constraint({
    required String message,
    Object? originalException,
  }) = DatabaseConstraintException;

  const factory DatabaseException.operation({
    required String message,
    Object? originalException,
  }) = DatabaseOperationException;
}
