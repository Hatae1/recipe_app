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
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/photo@2x.png'),
                              fit: BoxFit.cover,
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(1.0),
                                  BlendMode.softLight),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.white.withOpacity(1),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '오',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  TextSpan(text: '늘의 '),
                                  TextSpan(
                                    text: '레',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w100,
                                ),
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
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            alignment: Alignment.topLeft,
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '오늘은 ',
                                  ),
                                  TextSpan(
                                    text: '간편식',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(text: '이 '),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 30),
                            alignment: Alignment.topLeft,
                            child: Text.rich(
                              TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 26),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '어떠신가요? ',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: 170,
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/menu/menu1.png',
                                          width: 75,
                                          height: 75,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '면요리',
                                          style: TextStyle(
                                            color: Color(0xFFFFAA00),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/menu/menu2.png',
                                          width: 75,
                                          height: 75,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '건강식',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/menu/menu3.png',
                                          width: 75,
                                          height: 75,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '음료',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Image.asset(
                                          'assets/images/menu/menu4.png',
                                          width: 75,
                                          height: 75,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          '간편식',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(
                              left: 30,
                            ),
                            child: Text(
                              '추천레시피',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 320,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(
                                  width: 30,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 239,
                                      height: 320,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              width: 239,
                                              height: 320,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/main-list4.jpg',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Colors.transparent,
                                                        Colors.black
                                                            .withOpacity(0.7),
                                                      ],
                                                      begin:
                                                          Alignment(0.1, 0.2),
                                                      end: Alignment
                                                          .bottomCenter),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 70,
                                            left: 15,
                                            child: Text(
                                              '모두가 좋아하는',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 36,
                                            left: 15,
                                            child: Text(
                                              '맛있는 소세지',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Container(
                                      width: 239,
                                      height: 320,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            child: Container(
                                              width: 239,
                                              height: 320,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/main-list3.jpg',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Colors.transparent,
                                                        Colors.black
                                                            .withOpacity(0.7),
                                                      ],
                                                      begin:
                                                          Alignment(0.1, 0.2),
                                                      end: Alignment
                                                          .bottomCenter),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 70,
                                            left: 15,
                                            child: Text(
                                              '감탄이 절로나오는',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 36,
                                            left: 15,
                                            child: Text(
                                              '맛있는 볶음밥',
                                              style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          '쉐프의 팁',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF003234),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 144,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 326,
                              height: 144,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 295,
                                    height: 144,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 24,
                                            top: 21,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '오민식 쉐프',
                                                style: TextStyle(
                                                  color: Color(0xFF454F63),
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '곶감치즈말이',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFF454F63),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 166,
                                                child: Text(
                                                  '곶감 속에 크림 치즈를 쏙 넣어 돌돌 말아내면 와인과 잘 어울리는 근사한 술안주가 된답니다.',
                                                  style: TextStyle(
                                                    color: Color(0xFF454F63),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 11,
                                    child: Image.asset(
                                      'assets/images/tomato.png',
                                      width: 120,
                                      height: 120,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          '인기있는 레시피',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF003234),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 145,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 145,
                                  height: 145,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/main-list5.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                          child: Container(
                                            width: 145,
                                            height: 145,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black
                                                        .withOpacity(0.8),
                                                    Colors.transparent
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  stops: [
                                                    0.21,
                                                    0.7,
                                                  ],
                                                  end: Alignment.bottomCenter),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 15,
                                        child: Text(
                                          '소세지',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 36,
                                        left: 15,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              '4.6',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFFFAA00),
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: Color(0xFFFFAA00),
                                            )
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 145,
                                          height: 145,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                              gradient: LinearGradient(
                                                colors: [
                                                  Colors.black
                                                      .withOpacity(0.20),
                                                  Colors.black.withOpacity(0)
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 145,
                                  height: 145,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/main-list3.jpg'),
                                                fit: BoxFit.cover,
                                              )),
                                          child: Container(
                                            width: 145,
                                            height: 145,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(20),
                                              ),
                                              gradient: LinearGradient(
                                                  colors: [
                                                    Colors.black
                                                        .withOpacity(0.8),
                                                    Colors.transparent
                                                  ],
                                                  begin: Alignment.topCenter,
                                                  stops: [
                                                    0.21,
                                                    0.7,
                                                  ],
                                                  end: Alignment.bottomCenter),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 15,
                                        left: 15,
                                        child: Text(
                                          '티라미수',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 36,
                                        left: 15,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '4.6',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xFFFFAA00),
                                              ),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 12,
                                              color: Color(0xFFFFAA00),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
