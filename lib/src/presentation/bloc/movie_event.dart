part of 'movie_bloc.dart';

sealed class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchMovies extends MovieEvent {
  final String query;

  const FetchMovies(this.query);

  @override
  List<Object> get props => [query];
}
