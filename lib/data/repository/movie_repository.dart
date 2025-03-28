import 'package:flutter_repository_clean/domain/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies({ required int page, required int limit});
}