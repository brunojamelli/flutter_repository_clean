// floor_movie_mapper.dart
import 'package:flutter_repository_clean/data/database/entity/floor_movie_entity.dart';
import 'package:flutter_repository_clean/domain/movie.dart';

class FloorMovieMapper {
  /// Converte uma entidade Floor para Movie (domínio)
  Movie toMovie(FloorMovieEntity entity) {
    return Movie(
      title: entity.title,
      year: entity.year,
      extract: entity.extract,
      imgUrl: entity.imageUrl,
    );
  }

  /// Converte uma lista de entidades Floor para Movies
  List<Movie> toMovies(List<FloorMovieEntity> entities) {
    return entities.map((entity) => toMovie(entity)).toList();
  }

  /// Converte um Movie (domínio) para entidade Floor
  FloorMovieEntity toFloorEntity(Movie movie) {
    return FloorMovieEntity(
      id: null, // ID será gerado automaticamente
      title: movie.title,
      year: movie.year,
      extract: movie.extract,
      imageUrl: movie.imgUrl,
    );
  }

  /// Converte uma lista de Movies para entidades Floor
  List<FloorMovieEntity> toFloorEntities(List<Movie> movies) {
    return movies.map((movie) => toFloorEntity(movie)).toList();
  }
}