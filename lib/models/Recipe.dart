class RecipeItem {
  int minute;
  String recipeDescription;
  String imageUrl;

  RecipeItem({
    this.minute,
    this.recipeDescription,
    this.imageUrl,
  });
}

class Recipe {
  List<RecipeItem> _items = [];
  //Map<String, RecipeItem> _items = [];

  get items {
    return [..._items];
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(int minute, String recipeDescription, String imageUrl) {
    _items.add(RecipeItem(
      minute: minute,
      recipeDescription: recipeDescription,
      imageUrl: imageUrl,
    ));
  }
}
