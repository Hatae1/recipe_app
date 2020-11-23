import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailRecipe extends StatefulWidget {
  static const routeName = '/DetailRecipe';
  String _recipeRowId;
  bool completeFetchData = false;

  DetailRecipe(this._recipeRowId);
  String recipeSummary;
  List<Map<String, dynamic>> recipeCookInfo = [];
  List<Map<String, dynamic>> recipeItemInfo = [];

  String recipeImage;

  @override
  _DetailRecipeState createState() => _DetailRecipeState();
}

class _DetailRecipeState extends State<DetailRecipe> {
  Future<void> getRecipeInfo() async {
    int recipeId;
    String recipeSummary;

    CollectionReference recipeInfo =
        FirebaseFirestore.instance.collection('recipeInformation');

    CollectionReference recipeCookInformation =
        FirebaseFirestore.instance.collection('recipeCookInformation');

    CollectionReference recipeItemInfo =
        FirebaseFirestore.instance.collection('recipeItemInfo');

    recipeId = await recipeInfo
        .doc(widget._recipeRowId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      recipeSummary = documentSnapshot.get('SUMRY');
      widget.recipeImage = documentSnapshot.get('IMG_URL');
      return documentSnapshot.get('RECIPE_ID');
    });

    await recipeCookInformation
        .where('RECIPE_ID', isEqualTo: recipeId)
        .get()
        .then((value) => {
              for (int i = 0; i < value.size; i++)
                {
                  widget.recipeCookInfo.add({
                    'COOKING_DC': value.docs[i].get('COOKING_DC'),
                    'IMG_URL': value.docs[i].get('STRE_STEP_IMAGE_URL')
                  })
                }
            });

    await recipeItemInfo
        .where('RECIPE_ID', isEqualTo: recipeId)
        .get()
        .then((value) => {
              for (int i = 0; i < value.size; i++)
                {
                  widget.recipeItemInfo.add({
                    'IRDNT_NM': value.docs[i].get('IRDNT_NM'),
                    'IRDNT_CPCTY': value.docs[i].get('IRDNT_CPCTY')
                  })
                }
            });

    setState(() {
      widget.recipeSummary = recipeSummary;
      widget.completeFetchData = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    getRecipeInfo();

    super.initState();
  }

  Widget recipeItemInfo(itemInfo) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            itemInfo['IRDNT_NM'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            itemInfo['IRDNT_CPCTY'],
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Widget recipeCookSequence(cookInfo, inddex) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'STEP${inddex + 1}',
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
            cookInfo['COOKING_DC'],
            style: TextStyle(
              height: 2,
              color: Color(0xFF333333),
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          cookInfo['IMG_URL'] != null
              ? Image.network(cookInfo['IMG_URL'])
              : SizedBox(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/SpeakRecipe');
        },
        label: Text('레시피 크게보기'),
        backgroundColor: Color(0xFFFFAA00),
      ),
      body: SafeArea(
        child: (!widget.completeFetchData)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
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
                              widget.recipeImage,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '장금이',
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
                                    widget.recipeSummary,
                                    style: TextStyle(
                                      height: 2,
                                      color: Color(0xFF333333),
                                      fontSize: 16,
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
                            for (int i = 0;
                                i < widget.recipeItemInfo.length;
                                i++)
                              recipeItemInfo(widget.recipeItemInfo[i]),
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
                            for (int i = 0;
                                i < widget.recipeCookInfo.length;
                                i++)
                              recipeCookSequence(widget.recipeCookInfo[i], i)
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
