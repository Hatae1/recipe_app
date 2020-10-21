import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../models/Recipe.dart';

class SpeakRecipe extends StatefulWidget {
  static const routeName = '/SpeakRecipe';
  @override
  _SpeakRecipeState createState() => _SpeakRecipeState();
}

class _SpeakRecipeState extends State<SpeakRecipe> {
  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  int currentIndex = 0;
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();
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

    initSpeechState();
    startListening();
    super.initState();
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
                    top: 10,
                    left: 10,
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
                                  'STEP1',
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
    );
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      _localeNames = await speech.locales();

      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageController.nextPage(
              duration: kTabScrollDuration,
              curve: Curves.ease,
            );
          },
          child: speech.isListening ? Icon(Icons.mic) : Icon(Icons.mic_off),
          backgroundColor: Color(0xFFFFAA00),
        ),
        body: SafeArea(
          child: Container(
            child: PageView.builder(
              controller: pageController,
              itemCount: recipe.itemCount,
              itemBuilder: (context, index) => recipePage(index),
              onPageChanged: (index) {
                currentIndex = index;
              },
            ),
          ),
        ),
      ),
    );
  }

  void startListening() {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 1000),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        listenMode: ListenMode.confirmation);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });

    print(result.recognizedWords);

    if (result.recognizedWords == '다음') {
      pageController.nextPage(
        duration: kTabScrollDuration,
        curve: Curves.ease,
      );
    }

    if (result.recognizedWords == '이전') {
      pageController.previousPage(
        duration: kTabScrollDuration,
        curve: Curves.ease,
      );
    }

    startListening();
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    // print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    // print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    // print(
    // "Received listener status: $status, listening: ${speech.isListening}");
    setState(() {
      lastStatus = "$status";
    });
  }

  _switchLang(selectedVal) {
    setState(() {
      _currentLocaleId = selectedVal;
    });
    print(selectedVal);
  }
}
