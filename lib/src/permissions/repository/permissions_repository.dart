import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:maps/src/core/domain/failures/failures.dart';
import 'package:maps/src/permissions/enum/permission_status.dart';
import 'package:permission_handler/permission_handler.dart'
    hide PermissionStatus;

/// An interface defining the contract for a Permission Repository.
/// This repository handles permissions.
abstract class IPermissionRepository {
  /// Checks if the location permission is granted.
  ///
  /// Returns a [Future] that completes with a [bool] indicating whether
  /// the location permission is granted.
  Future<bool> hasLocationPermission();

  /// Requests the location permission and returns the status of the request.
  ///
  /// Returns a [Future] that completes with an [Either] containing a [Failure]
  /// or a [PermissionStatus]. If the permission request is successful,
  ///  it returns the [PermissionStatus].
  /// If there is an error, it returns a [Failure].
  Future<Either<Failure, PermissionStatus>> locationPermissionRequested();
}

/// A concrete implementation of the [IPermissionRepository] that uses the
/// `permission_handler` package to handle permissions.
@LazySingleton(as: IPermissionRepository)
class PermissionRepository extends IPermissionRepository {
  @override
  Future<bool> hasLocationPermission() async {
    // Check if the location permission is granted using 
    //the `permission_handler` package.
    final isGranted = await Permission.location.isGranted;
    return isGranted;
  }

  @override
  Future<Either<Failure, PermissionStatus>>
      locationPermissionRequested() async {
    try {
      // Request the location permission using the `permission_handler` package.
      final status = await Permission.location.request();

      // Return the appropriate PermissionStatus based on the request result.
      if (status.isGranted) {
        return right(PermissionStatus.granted);
      }
      if (status.isPermanentlyDenied) {
        return right(PermissionStatus.permanentlyDenied);
      }
      return right(PermissionStatus.denied);
    } catch (e) {
      // Handle unexpected failures and return a Failure object.
      return left(
        const Failure.unexpected('Location Permission failed'),
      );
    }
  }
}
