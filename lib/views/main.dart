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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: double.infinity,
                    height: 875,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/images/photo@2x.png'),
                      fit: BoxFit.cover,
                    )),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          child: Text.rich(
                            TextSpan(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '오',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                TextSpan(text: '늘의 '),
                                TextSpan(
                                    text: '레',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: '시피',
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 62,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          alignment: Alignment.topLeft,
                          child: Text.rich(
                            TextSpan(
                              style:
                                  TextStyle(color: Colors.white, fontSize: 26),
                              children: <TextSpan>[
                                TextSpan(
                                  text: '오요',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextSpan(text: '님 '),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(30),
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
                              Text('전체'),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/pizza.png',
                                width: 60,
                                height: 60,
                              ),
                              Text('중식'),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/pizza.png',
                                width: 60,
                                height: 60,
                              ),
                              Text('한식'),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
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
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/pizza.png',
                                width: 60,
                                height: 60,
                              ),
                              Text('동남아시아'),
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
