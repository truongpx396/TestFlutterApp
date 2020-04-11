import 'dart:async';
import 'movie_api_provider.dart';
import '../models/item_model.dart';
import '../models/trailer_model.dart';
import 'package:inject/inject.dart';
import 'package:swagger/api.dart' as swagger;

class Repository {
  final MovieApiProvider moviesApiProvider;

  final swagger.PostsApi articleApi;

  @provide
  Repository(this.moviesApiProvider, this.articleApi);

  Future<ItemModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<TrailerModel> fetchTrailers(int movieId) =>
      moviesApiProvider.fetchTrailer(movieId);

  Future<List<swagger.ReadPost>> fetchAllArticles() => articleApi.postsGet();
}
