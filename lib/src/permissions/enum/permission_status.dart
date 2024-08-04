enum PermissionStatus {
  initial,
  granted,
  denied,
  permanentlyDenied;

  bool get isInitial => this == initial;
  bool get isGranted => this == granted;
  bool get isDenied => this == denied;
  bool get isPermanentlyDenied => this == permanentlyDenied;
}
