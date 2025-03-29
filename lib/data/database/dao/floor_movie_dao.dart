import 'package:floor/floor.dart';
import 'package:flutter_repository_clean/data/database/entity/floor_movie_entity.dart';

@dao
abstract class FloorMovieDao {
  @Query('SELECT * FROM movies ORDER BY id ASC')
  Future<List<FloorMovieEntity>> getAllMovies();

  @Query('SELECT * FROM movies LIMIT :limit OFFSET :offset')
  Future<List<FloorMovieEntity>> getMoviesPaginated(int limit, int offset);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovie(FloorMovieEntity movie);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertMovies(List<FloorMovieEntity> movies);

  @Query('DELETE FROM movies')
  Future<void> deleteAllMovies();

  @Query('SELECT * FROM movies WHERE id = :id')
  Future<FloorMovieEntity?> getMovieById(int id);
}