import 'package:flutter/material.dart';
import 'package:swagger/api.dart';
import 'ui/movie_list.dart';
import 'package:inject/inject.dart';
import 'ui/movie_detail.dart';
import 'ui/login.dart';
import 'ui/blog_screen.dart';
import 'models/item_model.dart';
import 'blocs/movies_bloc.dart';
import 'blocs/movie_detail_bloc.dart';
import 'blocs/articles_bloc.dart';
import 'ui/article_screen.dart';

import './themes.dart';

class App extends StatelessWidget {
  final MoviesBloc moviesBloc;
  final ArticlesBloc articlesBloc;
  final MovieDetailBloc movieDetailBloc;

  @provide
  App(this.moviesBloc, this.movieDetailBloc, this.articlesBloc) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData.dark(),
      // theme: ThemeData.light(),
      theme: kLightTheme,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == 'movieDetail') {
          final Result result = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return MovieDetail(
              movieDetailBloc,
              result,
            );
          });
        } else if (settings.name == 'articleDetail') {
          ReadPost data = settings.arguments;
          return MaterialPageRoute(builder: (context) {
            return ArticleDetail(data);
          });
        } else if (settings.name == 'blogScreen') {
          return MaterialPageRoute(builder: (context) {
            return BlogScreen(moviesBloc, articlesBloc);
          });
        }
      },
      // routes: {
      //   '/': (context) => MovieList(moviesBloc),
      // },
      // routes: {
      //   '/': (context) => BlogScreen(moviesBloc,articlesBloc),
      // },
      // routes: {
      //   '/': (context) => ArticleDetail(),
      // },
      routes: {
        '/': (context) => MyHomePage(title: 'DemoAuth0'),
      },
    );
  }
}
