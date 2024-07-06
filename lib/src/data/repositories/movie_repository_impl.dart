import 'package:my_movie_app/src/data/services/api_services.dart';
import 'package:my_movie_app/src/domain/entities/movie.dart';
import 'package:my_movie_app/src/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiService apiService;

  MovieRepositoryImpl(this.apiService);

  @override
  Future<List<Movie>> getMovies() async {
    return await apiService.fetchMovies();
  }
}
