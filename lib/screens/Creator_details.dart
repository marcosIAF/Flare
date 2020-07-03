import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flare/screens/CreatorsProvider.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/getflutter.dart';
import 'package:provider/provider.dart';
import 'package:flare/style/theme.dart' as Style;

class CreatorDetails extends StatelessWidget {
  int index;

  CreatorDetails(this.index);

  @override
  Widget build(BuildContext context) {
    return Consumer<CreatorProvider>(
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
                  imageUrl: viewModel.res[index].imageBackground,
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
                    tag: viewModel.res[index].id,
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
                      borderColor: Colors.amberAccent,
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
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: 355,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      viewModel.res[index].name,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 365,
                //left: MediaQuery.of(context).size.width / 3,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Center(
                            child: FilterChip(
                              backgroundColor: Colors.grey.shade200,
                              label: Text(viewModel.res[index].positions[0].name
                                  .toUpperCase()),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450,
                left: 20,
                right: 20,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: GFButton(
                      fullWidthButton: true,
                      shape: GFButtonShape.pills,
                      color: Colors.amberAccent,
                      animationDuration: Duration(seconds: 20),
                      child: Text(
                        'Total Games : ${viewModel.res[index].gamesCount.toString()}',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: -950,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 250.0,
                    child: TypewriterAnimatedTextKit(
                        onTap: () {
                          print("Tap Event");
                        },
                        text: [
                          'Description not available...',
                          'Description not available...',
                          'Description not available...',
                        ],
                        textStyle: TextStyle(
                            fontSize: 30.0,
                            fontFamily: "Agne",
                            color: Colors.grey),
                        textAlign: TextAlign.start,
                        alignment: AlignmentDirectional
                            .topStart // or Alignment.topLeft
                        ),
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
