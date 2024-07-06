import 'package:my_movie_app/src/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<List<Movie>> getMovies(String query);
}
