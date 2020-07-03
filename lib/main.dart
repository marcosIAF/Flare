import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:flare/models/creator_model.dart';
import 'package:flare/routes.dart';
import 'package:flare/screens/About.dart';
import 'package:flare/screens/CreatorsProvider.dart';
import 'package:flare/screens/Home_page.dart';
import 'package:flare/screens/Home_provider.dart';
import 'package:flare/screens/MostAnticipatedProvider.dart';
import 'package:flare/screens/moviesScreen/Home_Provider.dart';
import 'package:flare/widgets/Search.dart';
import 'package:flare/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Admob.initialize(getAppId());
  runApp(MyApp());
}

String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544~1458002511';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544~3347511713';
  }
  return null;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MostProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreatorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieHomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBar(),
        routes: Myroutes,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
      ),
    );
  }
}
