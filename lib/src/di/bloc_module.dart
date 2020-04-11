import 'package:inject/inject.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/movie_detail_bloc.dart';
import '../blocs/bloc_base.dart';
import '../resources/repository.dart';
import '../resources/movie_api_provider.dart';
import 'package:http/http.dart' show Client;
import 'package:swagger/api.dart';
import '../my_shared_preferences.dart';
import '../blocs/articles_bloc.dart';

@module
class BlocModule {
  @provide
  @singleton
  Client client() => Client();

  @provide
  @singleton
  MovieApiProvider movieApiProvider(Client client) => MovieApiProvider(client);

  @provide
  @singleton
  PostsApi articleApiProvider() {
    return PostsApi();
  }

  @provide
  @singleton
  Repository repository(
          MovieApiProvider movieApiProvider, PostsApi articlesApi) =>
      Repository(movieApiProvider, articlesApi);

  @provide
  BlocBase movieBloc(Repository repository) => MoviesBloc(repository);

  @provide
  BlocBase movieDetailBloc(Repository repository) =>
      MovieDetailBloc(repository);

  @provide
  BlocBase articleBloc(Repository repository) => ArticlesBloc(repository);
}
