import 'package:flutter/material.dart';
import 'package:softnexus/pages/choose_location.dart';
import 'package:softnexus/pages/home.dart';
import 'package:softnexus/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    }
  ));
}
