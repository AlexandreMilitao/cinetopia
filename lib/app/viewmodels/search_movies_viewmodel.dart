import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _moviesList = [];

  Future<List<Movie>> getPopularMoveis() async {
    final SearchMoviesService service = SearchPopularMoviesService();

    _moviesList = await service.getMovies();

    return _moviesList;
  }

  Future<List<Movie>> getMovie(String query) async {
    if (query.isEmpty) {
      _moviesList = await getPopularMoveis();
    } else {
      final SearchMoviesService service = SearchForMovie(query: query);
      _moviesList = await service.getMovies();
    }

    return _moviesList;
  }

  List<Movie> get moviesList => _moviesList;
}
