import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:maps/src/permissions/enum/permission_status.dart';
import 'package:maps/src/permissions/repository/permissions_repository.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

@injectable
class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  PermissionsBloc(this.permissionRepository) : super(const PermissionsState()) {
    on<LocationPermissionChecked>(_onLocationPermissionChecked);
    on<LocationPermissionRequested>(_onLocationPermissionRequested);
  }
  final IPermissionRepository permissionRepository;

  Future<void> _onLocationPermissionChecked(
    LocationPermissionChecked event,
    Emitter<PermissionsState> emit,
  ) async {
    final isGranted = await permissionRepository.hasLocationPermission();
    if (isGranted) {
      emit(
        state.copyWith(
          locationStatus: PermissionStatus.granted,
        ),
      );
    } else {
      add(LocationPermissionRequested());
    }
  }

  Future<void> _onLocationPermissionRequested(
    LocationPermissionRequested event,
    Emitter<PermissionsState> emit,
  ) async {
    final failureOrStatus =
        await permissionRepository.locationPermissionRequested();
    emit(
      failureOrStatus.fold(
        (_) => state.copyWith(
          locationStatus: PermissionStatus.failed,
        ),
        (status) => state.copyWith(
          locationStatus: status,
        ),
      ),
    );
  }
}
