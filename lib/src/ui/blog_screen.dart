import 'dart:math';

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';
import '../blocs/articles_bloc.dart';
import 'package:swagger/api.dart';

class BlogScreen extends StatefulWidget {
  final MoviesBloc _bloc;

  final ArticlesBloc _articlesBloc;

  BlogScreen(this._bloc, this._articlesBloc);

  @override
  State<StatefulWidget> createState() {
    return BlogScreenState();
  }
}

class BlogScreenState extends State<BlogScreen> {
  ScrollController controller;

  bool reachBottom = false;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  var items;

  List<ReadPost> cachedArticleList;

  @override
  void initState() {
    super.initState();
    widget._bloc.init();
    widget._bloc.fetchAllMovies();

    widget._articlesBloc.init();
    widget._articlesBloc.fetchAllArticles();

    controller = ScrollController()..addListener(_scrollListener);

    items = List<String>.generate(10000, (i) => "Item $i");

    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  @override
  void dispose() {
    widget._articlesBloc.dispose();
    widget._bloc.dispose();
    super.dispose();
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    // if (controller.position.extentAfter < 500) {
    //   setState(() {
    //     //items.addAll(new List.generate(42, (index) => 'Inserted $index'));
    //     reachBottom = true;
    //     widget._bloc.fetchMoreMovies();
    //   });
    // } else {
    //   setState(() {
    //     reachBottom = false;
    //   });
    // }
  }

  Future<bool> _refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        widget._bloc.fetchAllMovies();
        widget._articlesBloc.fetchAllArticles();
        return true;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var nestedScrollView = RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: CustomScrollView(controller: controller, slivers: <Widget>[
          SliverAppBar(
            title: Text("MovieList"),
            backgroundColor: Color(0xFF5CA0D3),
            expandedHeight: 200,
            actions: <Widget>[
              IconButton(
                  icon: const Icon(Icons.refresh),
                  tooltip: 'Refresh',
                  onPressed: () {
                    _refreshIndicatorKey.currentState.show();
                  }),
            ],
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              "https://images.unsplash.com/photo-1517404215738-15263e9f9178?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
              fit: BoxFit.fill,
            )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(
                  'Recent',
                  style: TextStyle(fontSize: 18),
                ),
                StreamBuilder(
                  stream: widget._articlesBloc.allArticles,
                  builder: (context, AsyncSnapshot<List<ReadPost>> snapshot) {
                    if (cachedArticleList != null) {
                      return buildArticleList(cachedArticleList);
                    }
                    if (snapshot.hasData) {
                      cachedArticleList = snapshot.data;
                      return buildArticleList(snapshot.data);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                Text(
                  'This month',
                  style: TextStyle(fontSize: 18),
                ),
                loadMoreItem()
              ],
            ),
          ),
        ]));
    return Scaffold(
        backgroundColor: Color(0xFFEFEFEF),
        body: SafeArea(top: false, bottom: false, child: nestedScrollView));
  }

  Widget loadMoreItem() {
    return reachBottom == true
        ? Container(
            color: Colors.greenAccent,
            child: FlatButton(child: Text("Load More"), onPressed: () {}))
        : Container();
  }

  Widget buildArticleList(List<ReadPost> data) {
    return SizedBox(
      height: 300.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) => Card(
          margin: EdgeInsets.only(right: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: buildArticleItem(data[index]),
        ),
      ),
    );
  }

  Widget buildArticleItem(ReadPost data) {
    return GestureDetector(
      onTap: () {
        openDetailPage(data, 0);
      },
      child: Container(
          padding: EdgeInsets.zero,
          width: 220,
          height: 300,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: buildAvatar(
                            'https://blockinsightshome.files.wordpress.com/2019/10/img14.jpg'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(data.createdByLogin),
                          Row(
                            children: <Widget>[
                              Text('9 mins read'),
                              Text(data.createdDateString),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          data.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Futura',
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(10.0),
                    bottomRight: const Radius.circular(10.0),
                  ),
                  child: Image.network(
                    'https://blockinsightshome.files.wordpress.com/2019/10/img14.jpg',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ])),
    );
  }

  Widget buildAvatar(String imgUrl) {
    return Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.fill, image: new NetworkImage(imgUrl))));
  }

  openDetailPage(ReadPost data, int index) {
    //Navigator.pushNamed(context, 'movieDetail', arguments: data.results[index]);
    Navigator.pushNamed(context, 'articleDetail', arguments: data);
  }
}
