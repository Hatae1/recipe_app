import 'package:flutter/material.dart';

class SpeakRecipe extends StatefulWidget {
  static const routeName = '/SpeakRecipe';
  @override
  _SpeakRecipeState createState() => _SpeakRecipeState();
}

class _SpeakRecipeState extends State<SpeakRecipe> {
  PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    pageController = PageController(
      initialPage: 1,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: PageView(
            controller: pageController,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        'http://file.okdab.com/recipe/148299577271500136.jpg'),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '달궈진 팬에 기름을 두르고 옷을 계란물옷을 입힌 동그랑땡을 노릇하게 익혀준다.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        'http://file.okdab.com/recipe/148299332509200128.jpg'),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '접시에 어린잎 채소를 깔아주고 그 위에 자른 김밥을 올려준다.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Image.network(
                        'http://file.okdab.com/recipe/148299332509700129.jpg'),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '믹서기에 두부 식초 설탕 마요네즈 통깨를 넣고 갈아 두부드레싱을 만들어 준다.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
