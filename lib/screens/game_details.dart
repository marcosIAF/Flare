import 'package:cached_network_image/cached_network_image.dart';
import 'package:flare/screens/MostAnticipatedProvider.dart';
import 'package:flare/screens/vide_webview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flare/style/theme.dart' as Style;

class GameDetails extends StatelessWidget {
  int index;
  GameDetails(this.index);
  bool testselect = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<MostProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          bottomNavigationBar: null,
          backgroundColor: Style.Colors.mainColor,
          //backgroundColor: Color(0xffEFF0F1),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: <Widget>[
                    Hero(
                      tag: viewModel.res[index].id,
                      child: Card(
                        elevation: 10,
                        child: Container(
                          height: 350,
                          width: 250,
                          decoration: BoxDecoration(
                            image: viewModel.res[index].backgroundImage == null
                                ? Icon(Icons.broken_image)
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image: CachedNetworkImageProvider(
                                        viewModel.res[index].backgroundImage),
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF2A313C),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                            child: Divider(
                              color: Colors.grey.shade500,
                              thickness: 5,
                              indent: MediaQuery.of(context).size.width / 2.5,
                              endIndent:
                                  MediaQuery.of(context).size.width / 2.5,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 10),
                            child: Text(
                              viewModel.res[index].name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2.0, horizontal: 15),
                            child: Text(
                              viewModel.res[index].released,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: ListView.builder(
                                itemCount:
                                    viewModel.res[index].parentPlatforms.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, indexxx) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: FilterChip(
                                      backgroundColor: Colors.grey.shade200,
                                      label: Text(viewModel
                                          .res[index]
                                          .parentPlatforms[indexxx]
                                          .platform
                                          .name),
                                    ),
                                  );
                                }),
                          ),
//                          Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: viewModel.res[index].parentPlatforms
//                                .map((gen) => Padding(
//                                      padding: const EdgeInsets.symmetric(
//                                          horizontal: 10.0),
//                                      child: FilterChip(
//                                          backgroundColor: Colors.grey.shade200,
//                                          label: Text(gen.platform.name),
//                                          onSelected: (b) {}),
//                                    ))
//                                .toList(),
//                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                '🏆${viewModel.res[index].rating}',
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Center(
                            child: RatingBarIndicator(
                              rating: viewModel.res[index].rating,
                              itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 5,
                              itemSize: 50.0,
                              direction: Axis.horizontal,
                            ),
                          ),
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      CircularPercentIndicator(
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        animation: true,
                                        animationDuration: 1800,
                                        radius: 100.0,
                                        lineWidth: 10.0,
                                        percent: viewModel
                                                .res[index].ratings[0].percent /
                                            100,
                                        center: new Text(
                                          '${viewModel.res[index].ratings[0].percent.toString()}%',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        progressColor: Colors.green,
                                      ),
                                      Text(
                                        'Exceptional',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      CircularPercentIndicator(
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        radius: 100.0,
                                        lineWidth: 10.0,
                                        animation: true,
                                        animationDuration: 1800,
                                        percent: viewModel
                                                .res[index].ratings[1].percent /
                                            100,
                                        center: new Text(
                                          '${viewModel.res[index].ratings[1].percent.toString()}%',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        progressColor: Colors.blue,
                                      ),
                                      Text(
                                        'Recommended',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                children: <Widget>[
                                  CircularPercentIndicator(
                                    animation: true,
                                    animationDuration: 1800,
                                    circularStrokeCap: CircularStrokeCap.round,
                                    radius: 100.0,
                                    lineWidth: 10.0,
                                    percent: viewModel
                                            .res[index].ratings[1].percent /
                                        100,
                                    center: new Text(
                                      '${viewModel.res[index].ratings[1].percent.toString()}%',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    progressColor: Colors.red,
                                  ),
                                  Text(
                                    'Meh',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Text(
                              '📷 ScreenShots',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
                            height: 200,
                            width: double.infinity,
                            child: ListView.builder(
                                primary: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel
                                    .res[index].shortScreenshots.length,
                                itemBuilder: (context, indexx) {
                                  return Card(
                                    elevation: 10,
                                    child: CachedNetworkImage(
                                      imageUrl: viewModel.res[index]
                                          .shortScreenshots[indexx].image,
                                    ),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Text(
                              '🎞️ Clips',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Stack(
                            children: <Widget>[
                              Container(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 2),
                                  child: CachedNetworkImage(
                                    imageUrl: viewModel.res[index].clip.preview,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 0,
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.play_circle_outline,
                                    color: Colors.amber,
                                    size: 40.0,
                                  ),
                                  onPressed: () {
                                    print('play clicked');
//                                    launch(viewModel.res[index].clip.clip, forceWebView: true);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => VideoWeb(
                                                viewModel
                                                    .res[index].clip.clip)));
                                  },
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Text(
                              '↗ Visit Store',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: ListView.builder(
                                itemCount: viewModel.res[index].stores.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, indexxxx) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: FilterChip(
                                      selectedColor: Colors.blue,
                                      backgroundColor: Colors.grey.shade200,
                                      label: Text(viewModel.res[index]
                                          .stores[indexxxx].store.name),
                                      onSelected: (b) {
                                        launch(viewModel
                                            .res[index].stores[indexxxx].urlEn);
                                      },
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
//                      Text(
//                        'Height: ${pokemon.height}',
//                      ),
//                      Text('Weight: ${pokemon.weight}'),
                  ],
                ),
              ),
            ),
          ),
//              Padding(
//                padding: const EdgeInsets.only(top: 40),
//                child: Align(
//                  alignment: Alignment.topCenter,
//                  child: Hero(
//                    tag: viewModel.res[index].id,
//                    child: Card(
//                      elevation: 10,
//                      child: Container(
//                        height: 250,
//                        width: 200,
//                        decoration: BoxDecoration(
//                          image: viewModel.res[index].backgroundImage == null
//                              ? Icon(Icons.broken_image)
//                              : DecorationImage(
//                                  fit: BoxFit.cover,
//                                  image: CachedNetworkImageProvider(
//                                      viewModel.res[index].backgroundImage),
//                                ),
//                        ),
//                      ),
//                    ),
////                  child: CircleAvatar(
////                    radius: 80,
////                    backgroundImage: CachedNetworkImageProvider(
////                      viewModel.res[index].backgroundImage,
////                    ),
////                  ),
//                  ),
//                ),
//              )
        );
      },
    );
  }
}

/*
Stack(
                            children: <Widget>[
                              Container(
                                child: CachedNetworkImage(
                                  imageUrl: viewModel.res[index].clip.preview,
                                ),
                              ),
                            ],
                          ),
 */
