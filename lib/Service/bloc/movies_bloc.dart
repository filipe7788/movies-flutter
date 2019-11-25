import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movies_flutter/Service/api.dart';
import './bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final apiClient = api();

  @override
  MoviesState get initialState => InitialMoviesState();

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is GetMoviesResume) {
      try {
        yield MoviesStateLoading();

        final movies = await apiClient.getMoviesResume(event.page);
        var movieToYield = MoviesStateLoaded(movies);
        yield movieToYield;
      } catch (_err) {
        print(_err);
        yield MoviesStateError(
            'Não foi possível buscar os filmes, verifique sua internet');
      }
    }
  }
}
