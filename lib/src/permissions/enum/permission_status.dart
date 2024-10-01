/// Enum representing the status of a permission request.
///
/// This enum is used to describe the various states a permission request
/// can be in after being handled by the permission handler.
enum PermissionStatus {
  /// Indicates that the permission status is in its initial state.
  initial,

  /// Indicates that the permission has been granted by the user.
  granted,

  /// Indicates that the permission has been denied by the user.
  denied,

  /// Indicates that the permission has been permanently denied by the user.
  /// The user cannot grant this permission from the app's interface and must
  /// go to the system settings to manually allow it.
  permanentlyDenied,

  /// Indicates that the permission request has been failed
  failed;

  /// Checks if the permission status is in the initial state.
  bool get isInitial => this == initial;

  /// Checks if the permission has been granted.
  bool get isGranted => this == granted;

  /// Checks if the permission has been denied.
  bool get isDenied => this == denied;

  /// Checks if the permission has been permanently denied.
  bool get isPermanentlyDenied => this == permanentlyDenied;

  /// Checks if the permission request has been failed.
  bool get isFailed => this == failed;
}
