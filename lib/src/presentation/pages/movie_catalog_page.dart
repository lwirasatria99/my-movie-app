import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_movie_app/src/presentation/bloc/movie_bloc.dart';
import 'package:my_movie_app/src/presentation/pages/favorited_list_page.dart';
import 'package:my_movie_app/src/presentation/widgets/movie_carousel.dart';

class MovieCatalogPage extends StatelessWidget {
  const MovieCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Movie Catalog'),
        actions: [
          IconButton(
            icon: Icon(Icons.star),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoritedListPage()));
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => context.read<MovieBloc>(),
        child: MovieCatalogView(),
      ),
    );
  }
}

class MovieCatalogView extends StatefulWidget {
  @override
  _MovieCatalogViewState createState() => _MovieCatalogViewState();
}

class _MovieCatalogViewState extends State<MovieCatalogView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(FetchMovies('gun'));
  }

  void _onSearch() {
    final query = _searchController.text;
    context.read<MovieBloc>().add(FetchMovies(query));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // SearchView
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) => _onSearch(),
          ),
          SizedBox(height: 20),

          // Carousel Image
          Expanded(child: BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is MovieLoaded) {
                return MovieCarousel(movies: state.movies);
              } else if (state is MovieError) {
                return Center(child: Text(state.message));
              }
              return Container();
            },
          ))
        ],
      ),
    );
  }
}
