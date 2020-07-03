import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flare/screens/Home_create_details.dart';
import 'package:flare/screens/Home_game_detials.dart';
import 'package:flare/style/theme.dart' as Style;
import 'package:flare/consts.dart';
import 'package:flare/services/api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:page_indicator/page_indicator.dart';
import 'package:provider/provider.dart';
import 'Home_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, viewModel, child) {
//        APIResponse apiModel = viewModel.apiResponse;
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
                  onTap: () {
//                    Navigator.push(context,
//                        MaterialPageRoute(builder: (context) => Search()));
                    show(context, viewModel);
                  },
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
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: viewModel.isLoading
              ? Center(child: CircularProgressIndicator())
              : LazyLoadRefreshIndicator(
                  isLoading: viewModel.isLoading,
                  onRefresh: () async {
                    print('help');
                    viewModel.getData();
                    viewModel.getPublishers();
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
                                  itemCount: viewModel.apiModell.results
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
                                                image:
                                                    CachedNetworkImageProvider(
                                                        viewModel
                                                            .apiModell
                                                            .results[index]
                                                            .backgroundImage),
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
//                                Positioned(
//                                  top: 0,
//                                  bottom: 0,
//                                  right: 0,
//                                  left: 0,
//                                  child: Icon(
//                                    FontAwesomeIcons.playCircle,
//                                    color: Style.Colors.secondColor,
//                                    size: 40.0,
//                                  ),
//                                ),
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
                                                  viewModel.apiModell
                                                      .results[index].name,
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
                                  viewModel.apiModell.results.take(5).length,
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Hero(
                                  tag: 'MostTitle',
                                  child: Text(
                                    '🔥 Most Anticipated',
                                    style: titlestyle,
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 25,
//                              fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/mostAnticipated');
                                  },
                                  child: Icon(Icons.play_circle_outline,
                                      size: 25, color: Style.Colors.titleColor
//                                    color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
//            Consumer<HomeProvider>(
//              builder: (context, viewModel, child) {
//                return MostAnti(context, viewModel);
//              },
//            ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            width: double.infinity,
                            height: 300,
                            child: ListView.builder(
                                itemCount: 20,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 250,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomeGameDetails(index)));
                                      },
                                      child: Card(
                                        elevation: 5,
                                        child: viewModel.isLoading
                                            ? Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              )
                                            : Hero(
                                                tag: viewModel.apiModell
                                                    .results[index].id,
                                                child: CachedNetworkImage(
                                                  imageUrl: viewModel
                                                      .apiModell
                                                      .results[index]
                                                      .backgroundImage,
                                                  fit: BoxFit.cover,
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
//                                : Image.network(
////                                'https://pub.dev/static/img/pub-dev-logo-2x.png?hash=umitaheu8hl7gd3mineshk2koqfngugi',
//                                    viewModel.apiModell.results[index]
//                                        .backgroundImage,
//                                    fit: BoxFit.cover,
//                                  ),
                                        //Icon(Icons.cloud_download, size: 50),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            width: double.infinity,
                            height: 80,
                            child: AdmobBanner(
                              adUnitId: getBannerAdUnitId(),
                              adSize: AdmobBannerSize.FULL_BANNER,
                            ),
//                            Center(child: Text('Ad Unit')),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Hero(
                                  tag: 'Creators',
                                  child: Text(
                                    ' 👨‍💻 Top Creators',
                                    style: titlestyle,
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 25,
//                              fontWeight: FontWeight.bold),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/allcreators');
                                  },
                                  child: Icon(
                                    Icons.play_circle_outline,
                                    size: 25,
                                    color: Style.Colors.titleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            height: 100,
                            child: ListView.builder(
                                itemCount: 10,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return viewModel.isLoading
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeCreatorDetails(
                                                              index)));
                                            },
                                            child: Hero(
                                              tag: viewModel.creatorModel
                                                  .results[index].id,
                                              child: CircleAvatar(
                                                radius: 50,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                  viewModel.creatorModel
                                                      .results[index].image,
                                                ),
//                                  child: CachedNetworkImage(
//                                    imageUrl: viewModel
//                                        .creatorModel.results[index].image,
//                                    fit: BoxFit.cover,
//                                    errorWidget: (context, url, error) =>
//                                        Icon(Icons.error),
//                                  ),
                                              ),
                                            ),
                                          ),
                                        );
                                }),
                          ),
                          SizedBox(
                            height: 25,
                            child: Center(
                              child: Divider(
                                color: Style.Colors.titleColor,
                                thickness: 4,
                                indent: MediaQuery.of(context).size.width / 2.5,
                                endIndent:
                                    MediaQuery.of(context).size.width / 2.5,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                'Made with 💛 in  India.',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey.shade500,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

void show(BuildContext context, HomeProvider viewModel) {
  APIResponse apiResponse = APIResponse();
  bool vb = false;
  String text;
  TextEditingController textEditingController = TextEditingController();
  showModalBottomSheet(
      backgroundColor: Style.Colors.mainColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//        isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                child: Center(
                  child: Divider(
                    color: Colors.white,
                    height: 20,
                    thickness: 3,
                    indent: 70,
                    endIndent: 70,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                height: 70,
                child: Card(
                  elevation: 10,
                  child: TextField(
////                    onChanged: (value) {
////                      setState(() {
////                        textEditingController.text == ""
////                            ? vb = false
////                            : vb = true;
////                      });
//                      print(text);
//                    },
                    controller: textEditingController,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                      suffixIcon: vb ? Icon(Icons.cancel) : null,
                      contentPadding: EdgeInsets.all(20),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text(
                  'Popular',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                width: double.infinity,
                height: 180,
                child: ListView.builder(
                    itemCount: 20,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 150,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HomeGameDetails(index)));
                          },
                          child: Card(
                            elevation: 10,
                            child: Hero(
                              tag: viewModel.apiModell.results[index].id,
                              child: CachedNetworkImage(
                                imageUrl: viewModel
                                    .apiModell.results[index].backgroundImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        );
      });
}
