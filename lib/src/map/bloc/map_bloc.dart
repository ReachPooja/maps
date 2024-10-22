import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:maps/src/core/domain/status/status.dart';
import 'package:maps/src/map/repository/map_repository.dart';

part 'map_event.dart';
part 'map_state.dart';

@injectable
class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(this.mapRepository) : super(const MapState()) {
    on<MapStarted>(_onMapStarted);
  }

  final IMapRepository mapRepository;

  Future<void> _onMapStarted(MapStarted event, Emitter<MapState> emit) async {
    emit(state.copyWith(status: const Status.loading()));

    final failureOrMarkers = await mapRepository.getMarkers();
    emit(
      failureOrMarkers.fold(
        (failure) => state.copyWith(status: Status.failure(failure)),
        (markers) => state.copyWith(
          status: const Status.success(),
          markers: markers,
        ),
      ),
    );
  }
}
