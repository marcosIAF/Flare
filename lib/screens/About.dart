import 'package:avatar_glow/avatar_glow.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flare/consts.dart';
import 'package:flare/screens/Home_provider.dart';
import 'package:flare/services/api_call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flare/style/theme.dart' as Style;
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  APIResponse apiResponse = APIResponse();
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              'About',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            centerTitle: true,
            leading: Icon(
              EvaIcons.menu2Outline,
              color: Colors.white,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  EvaIcons.paperPlane,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Style.Colors.mainColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: AvatarGlow(
                      endRadius: 100.0,
                      child: Material(
                        elevation: 8.0,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[100],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                EvaIcons.flash,
                                size: 50,
                              ),
                              Text(
                                'Fame',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          radius: 70.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'The ultimate collection',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500),
                  ),
                  Text(
                    'build v1.0.0',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Fame brings your favourite video games and movies all at one place. It is the ultimate collection of more than 120K+ video games and movies served at your fingertips.\nManage the games you played, watch for new releases and compete for the most impressive gaming collection among thousands of other gamers. Access the largest gaming database with more than 120k+ games available',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '~ Developer',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Rohit Yadav',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Follow Us',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          EvaIcons.facebook,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          launch(fburl);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          EvaIcons.twitter,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          launch(twitterurl);
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          EvaIcons.linkedin,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          launch(linkedinurl);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      '© copyright 2020 | All right reserved.',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
