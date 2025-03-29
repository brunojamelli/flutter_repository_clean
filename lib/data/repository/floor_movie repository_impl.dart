import 'package:flutter_repository_clean/data/database/dao/floor_movie_dao.dart';
import 'package:flutter_repository_clean/data/database/floor_movie_mapper.dart';
import 'package:flutter_repository_clean/data/network/client/api_client.dart';
import 'package:flutter_repository_clean/data/network/network_mapper.dart';
import 'package:flutter_repository_clean/data/repository/movie_repository.dart';
import 'package:flutter_repository_clean/domain/movie.dart';

class FloorMovieRepositoryImpl implements MovieRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;
  final FloorMovieDao floorMovieDao;
  final FloorMovieMapper floorMapper;

  FloorMovieRepositoryImpl({
    required this.apiClient,
    required this.networkMapper,
    required this.floorMovieDao,
    required this.floorMapper,
  });

  @override
  Future<List<Movie>> getMovies({required int page, required int limit}) async {
    // Tentar carregar a partir do banco de dados Floor
    final floorEntities = await floorMovieDao.getMoviesPaginated(limit, (page * limit) - limit);
    
    // Se existirem dados no banco local, retornar
    if (floorEntities.isNotEmpty) {
      return floorMapper.toMovies(floorEntities);
    }
    
    // Caso contrário, buscar pela API remota
    final networkEntity = await apiClient.getMovies(page: page, limit: limit);
    final movies = networkMapper.toMovies(networkEntity);
    
    // Salvar os dados no banco Floor para cache
    await floorMovieDao.insertMovies(floorMapper.toFloorEntities(movies));

    return movies;
  }
}