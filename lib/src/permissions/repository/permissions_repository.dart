import 'package:injectable/injectable.dart';
import 'package:maps/src/permissions/enum/permission_status.dart';
import 'package:permission_handler/permission_handler.dart'
    hide PermissionStatus;

abstract class IPermissionRepository {
  Future<PermissionStatus> locationPermissionChecked();
}

@LazySingleton(as: IPermissionRepository)
class PermissionRepository extends IPermissionRepository {
  PermissionRepository({required this.permission});

  final Permission permission;

  @override
  Future<PermissionStatus> locationPermissionChecked() async {
    return PermissionStatus.denied;
  }
}
