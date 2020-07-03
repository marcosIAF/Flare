import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flare/screens/CreatorsProvider.dart';
import 'package:flare/screens/Home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flare/style/theme.dart' as Style;

class HomeCreatorDetails extends StatelessWidget {
  int index;
  HomeCreatorDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Style.Colors.mainColor,
          body: SafeArea(
              child: Stack(
            overflow: Overflow.visible,
            fit: StackFit.loose,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: double.infinity,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      viewModel.creatorModel.results[index].imageBackground,
                ),
              ),
              Positioned(
                top: 2,
                //bottom: 0,
                left: 0,
                right: MediaQuery.of(context).size.width - 20,
                child: GestureDetector(
                  onTap: () {
                    print('icon back pressed');
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 5,
                left: 0,
                right: 0,
                child: Center(
                  child: Hero(
                    tag: viewModel.creatorModel.results[index].id,
                    child: CircularProfileAvatar(
                      viewModel.creatorModel.results[index].image,
                      //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
                      radius: 100,
                      // sets radius, default 50.0
                      backgroundColor: Colors.transparent,
                      // sets background color, default Colors.white
                      borderWidth: 10,
                      // sets border, default 0.0
                      // sets initials text, set your own style, default Text('')
                      borderColor: Colors.amberAccent,
                      // sets border color, default Colors.white
                      elevation: 5.0,
                      // sets elevation (shadow of the profile picture), default value is 0.0
                      foregroundColor: Colors.brown.withOpacity(0.5),
                      //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
                      cacheImage: true,
                      child: viewModel.creatorModel.results[index].image == null
                          ? Icon(Icons.error_outline)
                          : null,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 350,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      viewModel.creatorModel.results[index].name,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 360,
                left: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: ListView.builder(
                            itemCount: viewModel
                                .creatorModel.results[index].positions.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, indexxx) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Center(
                                  child: FilterChip(
                                    backgroundColor: Colors.grey.shade200,
                                    label: Text(viewModel
                                        .creatorModel
                                        .results[index]
                                        .positions[indexxx]
                                        .name),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450,
                left: 120,
                child: Center(
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                        'Game Count : ${viewModel.creatorModel.results[index].gamesCount.toString()}'),
                    color: Colors.amberAccent,
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}

//                  child: CircularProfileAvatar(
////                    viewModel.res[index].image,
////                    //sets image path, it should be a URL string. default value is empty string, if path is empty it will display only initials
////                    radius: 100,
////                    // sets radius, default 50.0
////                    backgroundColor: Colors.transparent,
////                    // sets background color, default Colors.white
////                    borderWidth: 10,
////                    // sets border, default 0.0
////                    // sets initials text, set your own style, default Text('')
////                    borderColor: Colors.amber.shade100,
////                    // sets border color, default Colors.white
////                    elevation: 5.0,
////                    // sets elevation (shadow of the profile picture), default value is 0.0
////                    foregroundColor: Colors.brown.withOpacity(0.5),
////                    //sets foreground colour, it works if showInitialTextAbovePicture = true , default Colors.transparent
////                    cacheImage: true,
////                    child: viewModel.res[index].image == null
////                        ? Icon(Icons.error_outline)
////                        : null,
////                    // allow widget to cache image against provided url
////                    // sets on tap// setting it true will show initials text above profile picture, default false
