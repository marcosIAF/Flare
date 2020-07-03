import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flare/models/moviesModels/genre.dart';
import 'package:flare/models/moviesModels/genres_response.dart';
import 'package:flare/screens/Home_provider.dart';
import 'package:flare/screens/moviesScreen/Home_Provider.dart';
import 'package:flare/screens/moviesScreen/movies_by_genres.dart';
import 'package:flutter/material.dart';
import 'package:flare/style/theme.dart' as Style;
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';

class MovieHome extends StatefulWidget {
  @override
  _MovieHomeState createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome>
    with SingleTickerProviderStateMixin {
  List<Genre> genres;
  //_MovieHomeState(this.genres);
  TabController _tabController;
  @override
//  void initState() {
//    super.initState();
//    _tabController = TabController(vsync: this, length: genres.length);
//    _tabController.addListener(() {
//      if (_tabController.indexIsChanging) {
////        moviesByGenreBloc..drainStream();
//      }
//    });
//  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieHomeProvider>(builder: (context, viewModel, child) {
      return Scaffold(
        backgroundColor: Style.Colors.mainColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: Icon(
            EvaIcons.menu2Outline,
            color: Colors.white,
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
//    onTap: () {
////                    Navigator.push(context,
////                        MaterialPageRoute(builder: (context) => Search()));
//    show(context, viewModel);
//    },
                child: Icon(
                  EvaIcons.searchOutline,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          title: Text(
            '⚡Fame',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: viewModel.isLoading
            ? Center(child: CircularProgressIndicator())
            : LazyLoadRefreshIndicator(
                isLoading: viewModel.isLoading,
                onRefresh: () async {
                  print('help');
                  viewModel.getData();
                  //viewModel.getPublishers();
                },
                onEndOfPage: () {
                  print('end');
                },
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 220,
                          child: PageIndicatorContainer(
                            align: IndicatorAlign.bottom,
                            indicatorSpace: 8.0,
                            padding: EdgeInsets.all(5.0),
                            indicatorColor: Style.Colors.titleColor,
                            indicatorSelectorColor: Style.Colors.secondColor,
                            pageView: PageView.builder(
                                controller: PageController(),
                                itemCount: viewModel.movieResponse.results
                                    .take(5)
                                    .length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 220,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  'https://image.tmdb.org/t/p/original${viewModel.movieResponse.results[index].backdropPath}'),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              Style.Colors.mainColor
                                                  .withOpacity(1.0),
                                              Style.Colors.mainColor
                                                  .withOpacity(0),
                                            ],
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.topCenter,
                                            stops: [
                                              0.0,
                                              0.9,
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        child: Icon(
                                          Icons.play_circle_outline,
                                          color: Style.Colors.secondColor,
                                          size: 40.0,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 30.0,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          width: 250,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                viewModel.movieResponse
                                                    .results[index].title,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    height: 1.5,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                            length:
                                viewModel.movieResponse.results.take(5).length,
                          ),
                        ),
                        //----------------Stack/PageIndicator finish-------------------
                        Container(
                            height: 307.0,
                            child: DefaultTabController(
                              length: viewModel.genreResponse.genres.length,
                              child: Scaffold(
                                backgroundColor: Style.Colors.mainColor,
                                appBar: PreferredSize(
                                  preferredSize: Size.fromHeight(50.0),
                                  child: AppBar(
                                    backgroundColor: Style.Colors.mainColor,
                                    bottom: TabBar(
                                      controller: _tabController,
                                      indicatorColor: Style.Colors.secondColor,
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      indicatorWeight: 3.0,
                                      unselectedLabelColor:
                                          Style.Colors.titleColor,
                                      labelColor: Colors.white,
                                      isScrollable: true,
                                      tabs: viewModel.genreResponse.genres
                                          .map((Genres genre) {
                                        return Container(
                                            padding: EdgeInsets.only(
                                                bottom: 15.0, top: 10.0),
                                            child: new Text(
                                                genre.name.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold,
                                                )));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                body: TabBarView(
                                  controller: _tabController,
                                  physics: NeverScrollableScrollPhysics(),
                                  children: viewModel.genreResponse.genres
                                      .map((Genres genre) {
                                    return MovieTile(genre.id);
                                  }).toList(),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
