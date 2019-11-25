import 'package:equatable/equatable.dart';
import 'package:movies_flutter/Model/MovieResume.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class InitialMoviesState extends MoviesState {
  const InitialMoviesState();
  @override
  List<Object> get props => [];
}

class MoviesStateLoading extends MoviesState {
  const MoviesStateLoading();
  @override
  List<Object> get props => [];
}

class MoviesStateLoaded extends MoviesState {
  final List<MovieResume> movies;
  const MoviesStateLoaded(this.movies);
  @override
  List<Object> get props => [movies];
}

class MoviesStateError extends MoviesState {
  final String message;
  const MoviesStateError(this.message);
  @override
  List<Object> get props => [message];
}
