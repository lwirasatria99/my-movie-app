import 'package:flutter/material.dart';

class FavoritedListPage extends StatelessWidget {
  FavoritedListPage({super.key});

  // final List<Map<String, String>> favoriteMovies = [
  //   {'image': 'assets/images/movie1.jpg', 'title': 'Movie 1', 'rating': '4.5'},
  //   {'image': 'assets/images/movie2.jpg', 'title': 'Movie 2', 'rating': '4.0'},
  //   {'image': 'assets/images/movie3.jpg', 'title': 'Movie 3', 'rating': '3.5'},
  // ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> favoriteMovies = [
      {
        'image': 'assets/images/movie1.jpg',
        'title': 'Movie 1',
        'rating': 4.5,
      },
      {
        'image': 'assets/images/movie2.jpg',
        'title': 'Movie 2',
        'rating': 4.0,
      },
      {
        'image': 'assets/images/movie3.jpg',
        'title': 'Movie 3',
        'rating': 3.5,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Movies'),
      ),
      body: ListView.builder(
        itemCount: favoriteMovies.length,
        itemBuilder: (context, index) {
          final movie = favoriteMovies[index];
          return Card(
            child: ListTile(
              leading: Image.asset(
                movie['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(movie['title']!),
              subtitle: Row(
                children: List.generate(5, (starIndex) {
                  return Icon(
                    starIndex < movie['rating']!.toInt()
                        ? Icons.star
                        : Icons.star_border,
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
