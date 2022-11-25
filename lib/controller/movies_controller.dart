import 'package:dart_movies_api_with_dartion/repositories/movies_repository.dart';

class MoviesController {
  final _moviesRepository = MoviesRepository();

  Future<void> findAll() async {
    final movies = await _moviesRepository.findAll();
    movies.forEach((movie) => print(movie));
  }

  Future<void> findById(String id) async {
    final movie = await _moviesRepository.findById(id);
    print(movie);
  }

  Future<void> update(String id, String image) async {
    final movie = await _moviesRepository.findById(id);
    if (movie.images.contains(image)) {
      print('Já tem');
    } else {
      movie.images.add(image);
      await _moviesRepository.update(movie);

      final alteredMovie = await _moviesRepository.findById(id);
      print(alteredMovie.images);
    }
  }
}
