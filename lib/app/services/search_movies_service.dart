// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import "package:http/http.dart" as http;

import 'package:cinetopia/app/helpers/consts.dart';
import 'package:cinetopia/app/models/movie.dart';

abstract class SearchMoviesService {
  Future<List<Movie>> getMovies();
}

class SearchPopularMoviesService implements SearchMoviesService {
  List<Movie> movies = [];

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(popularMoviesUrl),
        headers: requestHeader,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (e) {
      print(e);
      return movies;
    }
  }
}

class SearchForMovie implements SearchMoviesService {
  List<Movie> movies = [];

  final String query;
  SearchForMovie({
    required this.query,
  });

  @override
  Future<List<Movie>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(moviePrefixUrl + query + movieFilterSulfix),
        headers: requestHeader,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movie.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (e) {
      print(e);
      return movies;
    }
  }
}
