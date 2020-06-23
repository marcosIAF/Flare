import 'package:flare/routes.dart';
import 'package:flare/screens/About.dart';
import 'package:flare/screens/Home_page.dart';
import 'package:flare/screens/Home_provider.dart';
import 'package:flare/widgets/Search.dart';
import 'package:flare/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavBar(),
        routes: Myroutes,
        theme: ThemeData.dark(),
      ),
    );
  }
}
