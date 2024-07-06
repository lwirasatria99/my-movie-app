import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_movie_app/src/domain/entities/movie.dart';
import 'package:my_movie_app/src/domain/usecase/get_movies.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovies getMovies;

  MovieBloc(this.getMovies) : super(MovieInitial());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMovies) {
      yield MovieLoading();
      try {
        final movies = await getMovies.execute();
        yield MovieLoaded(movies: movies);
      } catch (e) {
        yield MovieError(message: e.toString());
      }
    }
  }
}
