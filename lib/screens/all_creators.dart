import 'dart:async';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flare/consts.dart';
import 'package:flare/models/api_model.dart';
import 'package:flare/models/creator_model.dart';
import 'package:flare/screens/Creator_details.dart';
import 'package:flare/screens/CreatorsProvider.dart';
import 'package:flare/screens/MostAnticipatedProvider.dart';
import 'package:flare/screens/game_details.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_refresh_indicator/lazy_load_refresh_indicator.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:flare/style/theme.dart' as Style;
import 'Home_provider.dart';

class AllCreators extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CreatorProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Style.Colors.mainColor,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
            title: Hero(
              tag: 'CreatorsTitle',
              child: Text(
                '👨‍💻 Top Creators',
                style: titlestyle,
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 25,
//                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: LazyLoadRefreshIndicator(
            scrollOffset: 150,
            onRefresh: () async {
              viewModel.page = 1;
              viewModel.res.clear();
              viewModel.getData();
            },
            isLoading: viewModel.isLoading,
            onEndOfPage: () async {
              print('hello');

              viewModel.getData();
              print(viewModel.res.length);
            },
            child: SafeArea(
              child: Column(
                children: <Widget>[
//                  Container(
//                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
//                    child: Align(
//                      alignment: Alignment.topCenter,
//                      child: Hero(
//                        tag: 'CreatorsTitle',
//                        child: Text(
//                          '👨‍💻 Top Creators',
//                          style: titlestyle,
////                style: TextStyle(
////                    color: Colors.white,
////                    fontSize: 25,
////                    fontWeight: FontWeight.bold),
//                        ),
//                      ),
//                    ),
//                  ),

                  GridCustom(viewModel),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class GridCustom extends StatelessWidget {
  CreatorProvider viewModel;
  ScrollController scr;
  GridCustom(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: //viewModel.isLoading
          viewModel.res == null ||
                  viewModel.res.length == 0 ||
                  viewModel.res.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.amber),
                ))
              : GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: viewModel.res.length,
                  itemBuilder: (context, index) {
//                viewModel.apiModell.results
//                    .map(
//                      (Results res) => GestureDetector(
//                      onTap: () {
//                        //TODO
//                      },
//                      child:
                    return Hero(
                      tag: viewModel.res[index].id,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircularProfileAvatar(
                          viewModel.res[index].image,
                          //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                          radius: 100,
                          // sets radius, default 50.0
                          backgroundColor: Colors.transparent,
                          // sets background color, default Colors.white
                          borderWidth: 10,
                          // sets border, default 0.0
                          // sets initials text, set your own style, default Text('')
                          borderColor: Colors.grey.shade700,
                          // sets border color, default Colors.white
                          elevation: 5.0,
                          // sets elevation (shadow of the profile picture), default value is 0.0
                          foregroundColor: Colors.brown.withOpacity(0.5),
                          //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                          cacheImage: true,
                          child: viewModel.res[index].image == null
                              ? Icon(
                                  EvaIcons.person,
                                  size: 100,
                                )
                              : null,
                          // allow widget to cache image against provided url
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreatorDetails(index)));
                          }, // sets on tap// setting it true will show initials text above profile picture, default false
                        ),
                      ),
                    );
                  },
                ),
    );
//                  .toList();
  }
}

testt(MostProvider viewModel) async {
  await Future.delayed(Duration(seconds: 10));
  return CircularProgressIndicator();
}
