import 'package:Smarket/data/function/similarity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UNIT TEST', () {
    test('calculateSimilarity returns 100% similarity', () {
      expect(
          calculateSimilarity({
            "egg": 3,
            "milk": 5,
            "salt": 1,
            "pepper": 1,
            "butter": 12,
            "cheese": 1,
            "vegetables": 2
          }),
          equals(100));
    });
    test('calculateSimilarity returns less than 100% similarity', () {
      expect(calculateSimilarity({"egg": 2, "flour": 1, "sugar": 1, "milk": 1}),
          lessThan(100));
    });
  });
}
