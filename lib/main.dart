import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/src/data/repositories/movie_repository_impl.dart';
import 'package:my_movie_app/src/data/services/api_services.dart';
import 'package:my_movie_app/src/domain/usecase/get_movies.dart';
import 'package:my_movie_app/src/presentation/bloc/movie_bloc.dart';
import 'package:my_movie_app/src/presentation/pages/movie_catalog_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => ApiService()),
        RepositoryProvider<MovieRepositoryImpl>(
          create: (context) => MovieRepositoryImpl(context.read<ApiService>()),
        ),
        RepositoryProvider<GetMovies>(
          create: (context) => GetMovies(context.read<MovieRepositoryImpl>()),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                MovieBloc(context.read<GetMovies>())..add(FetchMovies('gun')),
          ),
        ],
        child: MaterialApp(
          title: 'For Test Only',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MovieCatalogPage(),
        ),
      ),
    );
  }
}
