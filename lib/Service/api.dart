import 'dart:convert';
import 'package:movies_flutter/Model/MovieResume.dart';
import 'package:http/http.dart' as http;

class api {
  final baseUri = 'https://api.themoviedb.org/3';
  final endBaseUri = 'api_key=082fee9a3f4e7a0c73caaa62d0b51120&language=pt-BR';
  final baseImageUrl = 'http://image.tmdb.org/t/p/w185';

  Future<http.Response> makeRequest(String url, {String page = ''}) async {
    return await http.get(this.baseUri + url + this.endBaseUri + page);
  }

  getMoviesResume(int page) async {
    List<MovieResume> movies = [];
    var movie = await makeRequest('/movie/popular?', page: '&page=$page');
    if (movie.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(movie.body);
      var results = data['results'] as List;
      for (var item in results) {
        movies.add(MovieResume(
            movieImageUrl: (this.baseImageUrl + item['poster_path']),
            movieName: item['title']));
      }
      return movies;
    } else {
      throwError();
    }
  }

  throwError() {
    print('error na api');
  }

  getMovie() {}
}
