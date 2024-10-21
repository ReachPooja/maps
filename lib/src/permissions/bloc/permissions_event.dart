part of 'permissions_bloc.dart';

sealed class PermissionsEvent extends Equatable {
  const PermissionsEvent();

  @override
  List<Object> get props => [];
}

class LocationPermissionChecked extends PermissionsEvent {}
class LocationPermissionRequested extends PermissionsEvent {}
