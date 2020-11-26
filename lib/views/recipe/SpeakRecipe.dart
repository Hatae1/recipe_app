import 'package:flutter/material.dart';
import '../../models/Recipe.dart';

class SpeakRecipe extends StatefulWidget {
  static const routeName = '/SpeakRecipe';
  int recipeId;

  SpeakRecipe(this.recipeId);
  @override
  _SpeakRecipeState createState() => _SpeakRecipeState();
}

class _SpeakRecipeState extends State<SpeakRecipe> {
  int currentIndex = 0;

  Recipe recipe = Recipe();
  final PageController pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    recipe.addItem(
        5,
        '돼지고기는 먹기 좋은 크기로 자르고, 양파와 깻잎은 채를 썰어주세요. 대파와 청양고추, 홍고추는 어슷하게 썰어주세요.',
        'assets/images/speak_1.jpg');

    recipe.addItem(
        4,
        '볼에 양념재료를 넣어 섞은 후, 돼지고기를 넣고 주물러서 먼저 양념하고 양파와 대파를 더해 섞어 20분 정도 양념장에 재워주세요.',
        'assets/images/speak_2.jpg');

    recipe.addItem(
        4,
        '볼에 양념재료를 넣어 섞은 후, 돼지고기를 넣고 주물러서 먼저 양념하고 양파와 대파를 더해 섞어 20분 정도 양념장에 재워주세요.',
        'assets/images/speak_2.jpg');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget recipePage(index) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height - 24 - 182,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(recipe.items[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: ((index + 1) % 2 == 1) ? 10 : null,
                    left: ((index + 1) % 2 == 1) ? 10 : null,
                    right: ((index + 1) % 2 == 1) ? null : 10,
                    bottom: ((index + 1) % 2 == 1) ? null : 10,
                    child: Container(
                      width: 270,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black.withOpacity(0.3),
                                    Colors.black.withOpacity(0.4),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'STEP${index + 1}',
                                  style: TextStyle(
                                      color: Color(0xFFFFAA00),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  recipe.items[index].recipeDescription,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 24 - 182,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: recipe.itemCount,
                  itemBuilder: (context, index) => recipePage(index),
                  onPageChanged: (index) {
                    currentIndex = index;
                  },
                ),
              ),
              Container(
                height: 182,
                decoration: BoxDecoration(
                  color: Color(0xFFFFAA00),
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/avatar@2x.png',
                              width: 36, height: 36),
                          SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '김벳남 요리왕국',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '베트남 요리 전문가',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Slider(
                          value: 50,
                          min: 0,
                          max: 100,
                          activeColor: Colors.white,
                          inactiveColor: Color(0xFFF5C663),
                          onChanged: (double value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.fast_rewind_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                            Icon(
                              Icons.fast_forward_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
