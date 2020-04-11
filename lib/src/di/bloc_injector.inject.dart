import 'bloc_injector.dart' as _i1;
import 'bloc_module.dart' as _i2;
import 'package:http/src/client.dart' as _i3;
import '../resources/movie_api_provider.dart' as _i4;
import 'package:swagger/api.dart' as _i5;
import '../resources/repository.dart' as _i6;
import 'dart:async' as _i7;
import '../app.dart' as _i8;
import '../blocs/movies_bloc.dart' as _i9;
import '../blocs/movie_detail_bloc.dart' as _i10;
import '../blocs/articles_bloc.dart' as _i11;

class BlocInjector$Injector implements _i1.BlocInjector {
  BlocInjector$Injector._(this._blocModule);

  final _i2.BlocModule _blocModule;

  _i3.Client _singletonClient;

  _i4.MovieApiProvider _singletonMovieApiProvider;

  _i5.PostsApi _singletonPostsApi;

  _i6.Repository _singletonRepository;

  static _i7.Future<_i1.BlocInjector> create(_i2.BlocModule blocModule) async {
    final injector = BlocInjector$Injector._(blocModule);

    return injector;
  }

  _i8.App _createApp() => _i8.App(
      _createMoviesBloc(), _createMovieDetailBloc(), _createArticlesBloc());
  _i9.MoviesBloc _createMoviesBloc() => _i9.MoviesBloc(_createRepository());
  _i6.Repository _createRepository() => _singletonRepository ??=
      _blocModule.repository(_createMovieApiProvider(), _createPostsApi());
  _i4.MovieApiProvider _createMovieApiProvider() =>
      _singletonMovieApiProvider ??=
          _blocModule.movieApiProvider(_createClient());
  _i3.Client _createClient() => _singletonClient ??= _blocModule.client();
  _i5.PostsApi _createPostsApi() =>
      _singletonPostsApi ??= _blocModule.articleApiProvider();
  _i10.MovieDetailBloc _createMovieDetailBloc() =>
      _i10.MovieDetailBloc(_createRepository());
  _i11.ArticlesBloc _createArticlesBloc() =>
      _i11.ArticlesBloc(_createRepository());
  @override
  _i8.App get app => _createApp();
}
