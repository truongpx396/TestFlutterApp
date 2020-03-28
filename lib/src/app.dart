import 'package:flutter/material.dart';
import 'ui/movie_list.dart';
import 'package:inject/inject.dart';
import 'ui/movie_detail.dart';
import 'ui/login.dart';
import 'ui/blog_screen.dart';
import 'models/item_model.dart';
import 'blocs/movies_bloc.dart';
import 'blocs/movie_detail_bloc.dart';

class App extends StatelessWidget {
  final MoviesBloc moviesBloc;
  final MovieDetailBloc movieDetailBloc;

  @provide
  App(this.moviesBloc, this.movieDetailBloc) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
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
        }
      },
      // routes: {
      //   '/': (context) => MovieList(moviesBloc),
      // },
      routes: {
        '/': (context) => BlogScreen(moviesBloc),
      },
      //  routes: {
      //   '/': (context) => MyHomePage(title: 'DemoAuth0'),
      // },
    );
  }
}
