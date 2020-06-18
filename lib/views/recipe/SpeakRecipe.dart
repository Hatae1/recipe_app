import 'package:flutter/material.dart';

import '../../models/Recipe.dart';
import '../../models/Recipe.dart';

class SpeakRecipe extends StatefulWidget {
  static const routeName = '/SpeakRecipe';
  @override
  _SpeakRecipeState createState() => _SpeakRecipeState();
}

class _SpeakRecipeState extends State<SpeakRecipe> {
  PageController pageController;
  int currentPage = 0;
  Recipe recipe = Recipe();
  int timerTime = 0;

  @override
  void initState() {
    super.initState();
    recipe.addItem(5, '달궈진 팬에 기름을 두르고 옷을 계란물옷을 입힌 동그랑땡을 노릇하게 익혀준다.',
        'http://file.okdab.com/recipe/148299577271500136.jpg');
    recipe.addItem(1, '접시에 어린잎 채소를 깔아주고 그 위에 자른 김밥을 올려준다.',
        'http://file.okdab.com/recipe/148299332509200128.jpg');
    recipe.addItem(2, '믹서기에 두부 식초 설탕 마요네즈 통깨를 넣고 갈아 두부드레싱을 만들어 준다.',
        'http://file.okdab.com/recipe/148299332509700129.jpg');

    timerTime = recipe.items[0].minute;

    pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  Widget recipePage(index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(recipe.items[index].imageUrl),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              recipe.items[index].recipeDescription,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: PageView.builder(
            itemCount: recipe.itemCount,
            itemBuilder: (context, index) => recipePage(index),
            onPageChanged: (index) {
              timerTime = recipe.items[index].minute;
            },
          ),
        ),
      ),
    );
  }
}
