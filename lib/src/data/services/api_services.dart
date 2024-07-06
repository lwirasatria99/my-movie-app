import 'package:my_movie_app/src/common/constants.dart';
import 'package:my_movie_app/src/data/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  final String baseUrl =
      'https://streaming-availability.p.rapidapi.com/shows/search/title?country=us&title=gun&series_granularity=show&show_type=movie&output_language=en';
  final String apiKey = 'd4a30a47dcmsh619410b357ba35bp19b41ejsn02359b5166d6';

  Future<List<MovieModel>> fetchMovies() async {
    // final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    final response = await http.get(Uri.parse(baseUrl), headers: {
      'x-rapidapi-host': 'streaming-availability.p.rapidapi.com',
      'x-rapidapi-key': apiKey,
    });

    if (response.statusCode == 200) {
      final List<dynamic> movies = json.decode(response.body);
      // final List movies = data['results'];
      return movies.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
