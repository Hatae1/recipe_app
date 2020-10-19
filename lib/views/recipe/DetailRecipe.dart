import 'package:flutter/material.dart';

class DetailRecipe extends StatefulWidget {
  static const routeName = '/DetailRecipe';
  @override
  _DetailRecipeState createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        'http://file.okdab.com/UserFiles/searching/recipe/131400.jpg',
                        width: double.infinity,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(20.0),
                            topRight: const Radius.circular(20.0),
                          ),
                        ),
                        child: Column(
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
                                          color: Color(0xFF454F63),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '베트남 요리 전문가',
                                      style: TextStyle(
                                        color: Color(0xFF454F63),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              '따뜻한 밥과 함께해도 맛있고, 피로를 풀어주는 반주와 즐겨도 좋은 메뉴~ 고추장 제육볶음 이랍니다. 돼지고기를 활용해 온 가족이 즐기기에도 부담 없는데요. 레시피를 따라 맛있는 제육볶음을 완성해보세요.',
                              style: TextStyle(
                                height: 2,
                                color: Color(0xFF333333),
                                fontSize: 12,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              height: 1,
                              color: Color(0xFFFFAA00),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '재료',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '계란',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '5개',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '전분',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1/2T',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '부침가루',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1/2T',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '배추',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '2잎',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '호박',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1/2개',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '대파',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '1대',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset('assets/images/recipe1.png'),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 1,
                        color: Color(0xFFFFAA00),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        '레시피과정',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'STEP1',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFFAA00),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '돼지고기는 먹기 좋은 크기로 자르고, 양파와 깻잎은 채를 썰어주세요. 대파와 청양고추, 홍고추는 어슷하게 썰어주세요.',
                        style: TextStyle(
                          height: 2,
                          color: Color(0xFF333333),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/images/recipe2.png'),
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
