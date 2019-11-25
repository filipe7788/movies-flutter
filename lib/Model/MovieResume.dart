import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MovieResume extends Equatable {
  final String movieName;
  final String movieImageUrl;

  MovieResume({@required this.movieName, @required this.movieImageUrl});

  @override
  List<Object> get props => [movieName, movieImageUrl];
}
