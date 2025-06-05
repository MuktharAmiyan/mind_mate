import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mind_mate/ui/core/enums/mood.dart';

class DailyReflectionViewModel extends ChangeNotifier {
  Mood _mood = Mood.good;

  Mood get mood => _mood;

  set mood(Mood mood) {
    _mood = mood;
    notifyListeners();
  }

  void save() {
    log('Mode Saved');
  }
}
