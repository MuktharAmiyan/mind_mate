import 'package:flutter/material.dart';
import 'package:mind_mate/utils/assets.dart';

enum Mood {
  angry,
  shied,
  good,
  stressed;

  const Mood();
  Color get color => switch (this) {
    Mood.angry => Color(0xFFEBACA5),

    Mood.shied => Color(0xFF89AAAD),

    Mood.good => Color(0xFFDDDB76),
    Mood.stressed => Color(0xFFD8B4BF),
  };

  String get imagePath => switch (this) {
    Mood.angry => Assets.angry,
    Mood.shied => Assets.shied,
    Mood.good => Assets.good,
    Mood.stressed => Assets.stressed,
  };

  static double sweepAngle = 360 / (Mood.values.length);
}
