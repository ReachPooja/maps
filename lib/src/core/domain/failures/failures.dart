import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

/// A union class representing different types of failures that can occur
/// in the application.
///
/// This class uses the `freezed` package to generate the necessary boilerplate
/// code for immutability, equality, and pattern matching.
@freezed
class Failure with _$Failure implements Exception {
  /// A failure type indicating a generic value-related error.
  ///
  /// [message] provides additional information about the failure.
  const factory Failure.value(
    String? message,
  ) = _Value;

  /// A failure type indicating a generic error.
  ///
  /// [message] provides additional information about the failure.
  const factory Failure.error(
    String? message,
  ) = _Error;

  /// A failure type indicating a network-related error.
  ///
  /// [message] provides additional information about the failure.
  const factory Failure.network(
    String? message,
  ) = _Network;

  /// A failure type indicating an unexpected error.
  ///
  /// [message] provides additional information about the failure.
  const factory Failure.unexpected(
    String? message,
  ) = _Unexpected;
}