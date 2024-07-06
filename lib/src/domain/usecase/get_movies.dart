import 'package:my_movie_app/src/domain/entities/movie.dart';
import 'package:my_movie_app/src/domain/repositories/movie_repository.dart';

class GetMovies {
  final MovieRepository repository;

  GetMovies(this.repository);

  Future<List<Movie>> execute() async {
    return await repository.getMovies();
  }
}
