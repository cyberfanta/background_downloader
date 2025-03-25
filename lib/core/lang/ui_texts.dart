import 'package:flutter/material.dart';

import 'ui_text_en.dart';
import 'ui_text_es.dart';

class UiTexts extends ChangeNotifier {
  UiTexts(this._locale);

  Locale _locale;

  set locale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  String get title {
    return UiTextEn().title;
  }

  String get warning {
    if (_locale.languageCode == 'es') {
      return UiTextEs().warning;
    }

    return UiTextEn().warning;
  }
}
