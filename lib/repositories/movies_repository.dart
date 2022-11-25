import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/movie.dart';

class MoviesRepository {
  Future<List> findAll() async {
    final moviesResponse =
        await http.get(Uri.parse('http://localhost:3031/movies'));
    final moviesList = jsonDecode(moviesResponse.body);

    return moviesList.map<Movie>((movieMap) {
      return Movie.fromMap(movieMap);
    }).toList();
  }

  Future<Movie> findById(String id) async {
    final moviesResponse =
        await http.get(Uri.parse('http://localhost:3031/movies/$id'));
    return Movie.fromJson(moviesResponse.body);
  }

  Future<void> update(Movie movie) async {
    await http.put(
      Uri.parse('http://localhost:3031/movies/${movie.id}'),
      body: movie.toJson(),
      headers: {'content-type': 'application/json'},
    );
  }
}
