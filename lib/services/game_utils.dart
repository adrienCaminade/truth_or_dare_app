import 'dart:math';

import '../models/Game.dart';

class GameUtils {
  int? _previousIndexDare;
  int? _previousIndexTruth;

  Game getRandomDare(List<Game> dares) {
    final random = Random();
    int randomIndex;

    do {
      randomIndex = random.nextInt(dares.length);
    } while (_previousIndexDare != null && randomIndex == _previousIndexDare);

    _previousIndexDare = randomIndex;
    return dares[randomIndex];
  }

  Game getRandomTruth(List<Game> truthes) {
    final random = Random();
    int randomIndex;

    do {
      randomIndex = random.nextInt(truthes.length);
    } while (_previousIndexTruth != null && randomIndex == _previousIndexTruth);

    _previousIndexTruth = randomIndex;
    return truthes[randomIndex];
  }

  Future<void> displayBox(bool selected, Function setState) async {
    if (!selected) {
      await Future.delayed(Duration(milliseconds: 20));
      setState();
    }
  }
}
