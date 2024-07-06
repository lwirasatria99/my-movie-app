import 'package:my_movie_app/src/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required String title,
    required String imagePath,
    required double rating,
  }) : super(title: title, imagePath: imagePath, rating: rating);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      imagePath: json['poster_path'],
      rating: json['vote_average'].toDouble(),
    );
  }
}
