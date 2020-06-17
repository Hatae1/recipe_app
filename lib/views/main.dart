import 'package:flutter/material.dart';
import 'package:recipe/views/recipe/DetailRecipe.dart';
import 'package:recipe/views/recipe/SpeakRecipe.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '오늘의 레시피',
                        style: TextStyle(fontSize: 30),
                      ),
                      Icon(
                        Icons.search,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/pizza.png',
                                width: 60,
                                height: 60,
                              ),
                              Text('이탈리아'),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/suyang.png',
                                width: 60,
                                height: 60,
                              ),
                              Text('서양'),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/sushi.png',
                                width: 60,
                                height: 60,
                              ),
                              Text('일식'),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Text(
                  '오늘 요리는 이거 어때요?',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(height: 20),
                Container(
                  height: 240,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(DetailRecipe.routeName);
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                'http://file.okdab.com/UserFiles/searching/recipe/131400.jpg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '쌀국수',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      SizedBox(width: 15),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(SpeakRecipe.routeName);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'http://file.okdab.com/UserFiles/searching/recipe/000200.jpg',
                                width: 200,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '나물비빔밥',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'http://file.okdab.com/recipe/148291043686100008.jpg',
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '식빵고구마파이',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '인기 레시피',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              'http://file.okdab.com/recipe/147729991660000012.jpg',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '매운가지볶음',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'http://file.okdab.com/recipe/147433913098400906.jpg',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '바질페스토 스파게티',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              'http://file.okdab.com/UserFiles/searching/recipe/163900.jpg',
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '미소된장국',
                            style: TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
