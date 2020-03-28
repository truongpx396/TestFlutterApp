import 'dart:math';

import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../blocs/movies_bloc.dart';

class BlogScreen extends StatefulWidget {
  final MoviesBloc _bloc;

  BlogScreen(this._bloc);

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

  @override
  void initState() {
    super.initState();
    widget._bloc.init();
    widget._bloc.fetchAllMovies();
    controller = ScrollController()..addListener(_scrollListener);

    // WidgetsBinding.instance
    //     .addPostFrameCallback((_) => _refreshIndicatorKey.currentState.show());
  }

  @override
  void dispose() {
    widget._bloc.dispose();
    super.dispose();
  }

  void _scrollListener() {
    print(controller.position.extentAfter);
    if (controller.position.extentAfter < 500) {
      setState(() {
        //items.addAll(new List.generate(42, (index) => 'Inserted $index'));
        reachBottom = true;
        widget._bloc.fetchMoreMovies();
      });
    } else {
      setState(() {
        reachBottom = false;
      });
    }
  }

  Future<bool> _refresh() {
    return Future.delayed(
      Duration(seconds: 1),
      () => true,
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
              new IconButton(
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
                  'Headline',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: Center(child: Text('Dummy Card Text')),
                    ),
                  ),
                ),
                Text(
                  'Demo Headline 2',
                  style: TextStyle(fontSize: 18),
                ),
                _listItem(),
                StreamBuilder(
                  stream: widget._bloc.allMovies2,
                  builder: (context, AsyncSnapshot<List<Result>> snapshot) {
                    if (snapshot.hasData) {
                      return buildList(snapshot);
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                loadMoreItem()
              ],
            ),
          ),
        ]));
    return Scaffold(
        body: SafeArea(top: false, bottom: false, child: nestedScrollView));
  }

  Widget loadMoreItem() {
    return reachBottom == true
        ? Container(
            color: Colors.greenAccent,
            child: FlatButton(child: Text("Load More"), onPressed: () {}))
        : Container();
  }

  _listItem() {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MovieCard(),

          MovieCard(),

          MovieCard()

          ///add more as you wish
        ],
      ),
    );
  }

  Widget buildList(AsyncSnapshot<List<Result>> snapshot) {
    return GridView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: snapshot.data.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return (index == snapshot.data.length)
              ? Container(
                  color: Colors.greenAccent,
                  child: FlatButton(child: Text("Load More"), onPressed: () {}))
              : GridTile(
                  child: InkResponse(
                    enableFeedback: true,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w185${snapshot.data[index].poster_path}',
                      fit: BoxFit.cover,
                    ),
                    // onTap: () => openDetailPage(snapshot.data, index),
                  ),
                );
        });
  }

  openDetailPage(ItemModel data, int index) {
    Navigator.pushNamed(context, 'movieDetail', arguments: data.results[index]);
  }
}

class MovieCard extends StatelessWidget {
  String path = "images/svgs/yts_logo.svg";

  int ratings = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 3),
      width: 200,
      height: 300,
      child: Column(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 12,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.blue,
            ),
          ),
          //title
          SizedBox(
            height: 5,
          ),
          Text("title",
              style: TextStyle(
                  fontFamily: 'open_sans',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),
          IconTheme(
            data: IconThemeData(
              color: Colors.amber,
              size: 20,
            ),
            child: _provideRatingBar(3),
          )
          //ratings
        ],
      ),
    );
  }

  _provideRatingBar(int rating) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Icon(
            index < rating ? Icons.star : Icons.star_border,
          );
        }));
  }
}
