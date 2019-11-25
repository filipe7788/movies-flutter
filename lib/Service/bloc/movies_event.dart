import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class GetMoviesResume extends MoviesEvent {
  final int page;
  const GetMoviesResume(this.page);
  @override
  List<Object> get props => [page];
}

class GetMoviesDetail extends MoviesEvent {
  final int movieId;
  const GetMoviesDetail(this.movieId);

  @override
  List<Object> get props => [movieId];
}
