import 'package:swagger/api.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:inject/inject.dart';
import 'bloc_base.dart';

class ArticlesBloc extends BlocBase {
  final Repository _repository;

  PublishSubject<List<ReadPost>> _articlesFetcher;

  @provide
  ArticlesBloc(this._repository);

  init() {
    _articlesFetcher = PublishSubject<List<ReadPost>>();
  }

  Stream<List<ReadPost>> get allArticles => _articlesFetcher.stream;

  fetchAllArticles() async {
    List<ReadPost> articleList = await _repository.fetchAllArticles();
    _articlesFetcher.sink.add(articleList);
  }

  @override
  dispose() {
    _articlesFetcher.close();
  }
}
