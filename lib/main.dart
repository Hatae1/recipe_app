import 'package:flutter/material.dart';
import 'package:recipe/views/recipe/DetailRecipe.dart';
import 'package:recipe/views/main.dart';
import 'package:recipe/views/recipe/SpeakRecipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "NaNumSquare",
      ),
      home: MainPage(),
      routes: {
        DetailRecipe.routeName: (ctx) => DetailRecipe(),
        SpeakRecipe.routeName: (ctx) => SpeakRecipe()
      },
    );
  }
}
