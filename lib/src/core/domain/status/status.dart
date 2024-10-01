import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maps/src/core/domain/failures/failures.dart';

part 'status.freezed.dart';

/// A union class representing the different states of a process.
///
/// This class uses the `freezed` package to generate the necessary boilerplate
/// code for immutability, equality, and pattern matching.
@freezed
class Status with _$Status {
  // Private constructor for the Status class
  const Status._();

  /// Represents the initial state of the process.
  const factory Status.initial() = _Initial;

  /// Represents the loading state of the process.
  const factory Status.loading() = _Loading;

  /// Represents the success state of the process.
  const factory Status.success() = _Success;

  /// Represents the failure state of the process.
  ///
  /// [failure] provides additional information about the failure,
  /// defaulting to an unexpected failure.
  const factory Status.failure([
    @Default(Failure.unexpected('')) Failure failure,
  ]) = _StatusFailure;

  /// Checks if the status is in the initial state.
  bool get isInitial => this == const Status.initial();

  /// Checks if the status is in the loading state.
  bool get isLoading => this == const Status.loading();

  /// Checks if the status is in the success state.
  bool get isSuccess => this == const Status.success();

  /// Checks if the status is in the failure state.
  bool get isFailure => this == const Status.failure();
}