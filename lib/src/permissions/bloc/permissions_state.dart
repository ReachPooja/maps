part of 'permissions_bloc.dart';

class PermissionsState extends Equatable {
  const PermissionsState({
    this.locationStatus = PermissionStatus.initial,
  });

  final PermissionStatus locationStatus;

  @override
  List<Object> get props => [locationStatus];

  PermissionsState copyWith({
    PermissionStatus? locationStatus,
  }) {
    return PermissionsState(
      locationStatus: locationStatus ?? this.locationStatus,
    );
  }
}
