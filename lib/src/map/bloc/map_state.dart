part of 'map_bloc.dart';

class MapState extends Equatable {
  const MapState({
    this.status = const Status.initial(),
    this.markers = const <Marker>{},
  });

  final Status status;
  final Set<Marker> markers;

  @override
  List<Object> get props => [status, markers];

  MapState copyWith({
    Status? status,
    Set<Marker>? markers,
  }) {
    return MapState(
      status: status ?? this.status,
      markers: markers ?? this.markers,
    );
  }
}
