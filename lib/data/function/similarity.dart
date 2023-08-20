double calculateSimilarity(Map<String, int> inputMap) {
  double similarity = 0;
  Map<double, String> finalMap = {};
  // Map<String, int> inputMap = {
  //   "egg": 3,
  //   "milk": 5,
  //   "salt": 1,
  //   "pepper": 1,
  //   "butter": 12,
  //   "cheese": 1,
  //   "vegetables": 2
  // };

  for (var recipe in recipes) {
    double ratio = 0;
    String recipeName = recipe.keys.first;

    Map<String, int> ingredients = recipe.values.first;
    int len = ingredients.length;
    for (var ingredientEntry in ingredients.entries) {
      String ingredientName = ingredientEntry.key;
      int quantity = ingredientEntry.value;

      int value = inputMap[ingredientName] ?? 0;
      if (inputMap.containsKey(ingredientName)) {
        ratio += 100.0 - ((quantity - value) < 0 ? 0 : quantity - value);
      }
    }
    similarity = ratio / len;
    finalMap[double.parse(similarity.toStringAsFixed(2))] = recipeName;
    // print('Recipe: $recipeName');
    // print('Similarity: $similarity%');
    // print('------------------------');
  }
  List<MapEntry<double, String>> sortedEntries = finalMap.entries.toList()
    ..sort((a, b) => b.key.compareTo(a.key));

  Map<double, String> sortedMap = Map.fromEntries(sortedEntries);
  return sortedMap.keys.toList().first;
}

void main() {
  // Map<double, String> similarity = calculateSimilarity();

  // var keys = similarity.keys.toList();
  // var val = similarity[keys[0]];
}

List<Map<String, Map<String, int>>> recipes = [
  {
    "cake": {
      "egg": 2,
      "flour": 1,
      "sugar": 1,
      "butter": 1,
      "vanilla extract": 1,
      "baking powder": 1,
      "milk": 1
    }
  },
  {
    "pizza": {
      "flour": 2,
      "yeast": 1,
      "sugar": 1,
      "salt": 1,
      "olive oil": 1,
      "water": 1,
      "tomato sauce": 1,
      "cheese": 2,
      "toppings": 3
    }
  },
  {
    "smoothie": {
      "banana": 2,
      "strawberries": 1,
      "yogurt": 1,
      "milk": 1,
      "honey": 1,
      "ice cubes": 4
    }
  },
  {
    "pancakes": {
      "flour": 1,
      "sugar": 1,
      "baking powder": 1,
      "salt": 1,
      "milk": 1,
      "egg": 1,
      "butter": 1
    }
  },
  {
    "omelette": {
      "egg": 3,
      "milk": 2,
      "salt": 1,
      "pepper": 1,
      "butter": 1,
      "cheese": 1,
      "vegetables": 2
    }
  },
  {
    "salad": {
      "lettuce": 1,
      "tomato": 2,
      "cucumber": 1,
      "onion": 1,
      "bell pepper": 1,
      "olives": 0,
      "feta cheese": 1,
      "olive oil": 1,
      "lemon juice": 1,
      "salt": 1,
      "pepper": 1
    }
  },
  {
    "muffins": {
      "flour": 1,
      "sugar": 1,
      "baking powder": 1,
      "salt": 1,
      "milk": 1,
      "egg": 1,
      "butter": 1
    }
  },
  {
    "stir-fry": {
      "chicken": 1,
      "vegetables": 3,
      "soy sauce": 1,
      "garlic": 2,
      "ginger": 1,
      "cornstarch": 1,
      "sesame oil": 1,
      "salt": 1,
      "pepper": 1
    }
  },
  {
    "pasta": {
      "pasta": 1,
      "tomato sauce": 1,
      "ground beef": 1,
      "onion": 1,
      "garlic": 2,
      "olive oil": 1,
      "salt": 1,
      "pepper": 1,
      "Italian seasoning": 1,
      "parmesan cheese": 1
    }
  }
];
