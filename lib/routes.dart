import 'package:flare/screens/Home_page.dart';
import 'package:flare/screens/MostAnticipated.dart';
import 'package:flare/screens/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Map<String, WidgetBuilder> Myroutes = {
  '/mostAnticipated': (context) => MostAnticipated(),
  '/test': (context) => Testsy(),
};
