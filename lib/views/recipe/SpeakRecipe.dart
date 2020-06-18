import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../models/Recipe.dart';

class SpeakRecipe extends StatefulWidget {
  static const routeName = '/SpeakRecipe';
  @override
  _SpeakRecipeState createState() => _SpeakRecipeState();
}

class _SpeakRecipeState extends State<SpeakRecipe>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  Recipe recipe = Recipe();
  int timerTime = 0;
  FlutterTts flutterTts;
  AnimationController _controller;
  int levelClock = 180;

  bool _hasSpeech = false;
  double level = 0.0;
  double minSoundLevel = 50000;
  double maxSoundLevel = -50000;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  List<LocaleName> _localeNames = [];
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    recipe.addItem(5, '달궈진 팬에 기름을 두르고 계란물옷을 입힌 동그랑땡을 노릇하게 익혀준다.',
        'http://file.okdab.com/recipe/148299577271500136.jpg');
    recipe.addItem(1, '접시에 어린잎 채소를 깔아주고 그 위에 자른 김밥을 올려준다.',
        'http://file.okdab.com/recipe/148299332509200128.jpg');
    recipe.addItem(2, '믹서기에 두부 식초 설탕 마요네즈 통깨를 넣고 갈아 두부드레싱을 만들어 준다.',
        'http://file.okdab.com/recipe/148299332509700129.jpg');

    speackRecipe();
    initSpeechState();
    startListening();
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

  void startListening() {
    lastWords = "";
    lastError = "";
    print('start listen');
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 1000),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: false,
        partialResults: true);
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
      print("${result.recognizedWords} - ${result.finalResult}");
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void soundLevelListener(double level) {
    minSoundLevel = min(minSoundLevel, level);
    maxSoundLevel = max(maxSoundLevel, level);
    //print("sound level $level: $minSoundLevel - $maxSoundLevel ");
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    print("Received error status: $error, listening: ${speech.isListening}");
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    print(
        "Received listener status: $status, listening: ${speech.isListening}");
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

  void speackRecipe() {
    setState(() {
      timerTime = recipe.items[currentIndex].minute * 60;
    });

    flutterTts = FlutterTts();
    //flutterTts.speak(recipe.items[currentIndex].recipeDescription);

    _controller = AnimationController(
        vsync: this,
        duration: Duration(
            seconds:
                timerTime) // gameData.levelClock is a user entered number elsewhere in the applciation
        );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    flutterTts.stop();
    super.dispose();
  }

  Widget recipePage(index) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(recipe.items[index].imageUrl),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  recipe.items[index].recipeDescription,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Countdown(
                  animation: StepTween(
                    begin: timerTime, // THIS IS A USER ENTERED NUMBER
                    end: 0,
                  ).animate(_controller),
                ),
              ],
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
            currentIndex = index;
            speackRecipe();
          },
        ),
      )),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);

    String timerText =
        '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';

    return Text(
      "$timerText",
      style: TextStyle(
        fontSize: 110,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
