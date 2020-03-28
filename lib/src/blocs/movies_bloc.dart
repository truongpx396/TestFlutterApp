import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import 'package:inject/inject.dart';
import 'bloc_base.dart';

class MoviesBloc extends BlocBase {
  final Repository _repository;
  PublishSubject<ItemModel> _moviesFetcher;

  PublishSubject<List<Result>> _movies2Fetcher;

  List<Result> _results = [];

  @provide
  MoviesBloc(this._repository);

  init() {
    _moviesFetcher = PublishSubject<ItemModel>();
    _movies2Fetcher = PublishSubject<List<Result>>();
  }

  Stream<ItemModel> get allMovies => _moviesFetcher.stream;

  Stream<List<Result>> get allMovies2 => _movies2Fetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
    _results = itemModel.results;
    _movies2Fetcher.sink.add(_results);
  }

  fetchMoreMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _results.addAll(itemModel.results);
    _movies2Fetcher.sink.add(_results);
  }

  @override
  dispose() {
    _moviesFetcher.close();
  }
}
