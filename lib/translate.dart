import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MainLocalizations {
  final Locale locale;

  MainLocalizations(this.locale);

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'messages title': 'Messages',
      'calendar title': 'Calendar',
      'academic title': 'Academic',
      'explore title': 'Explore',
      //Calendar
      'calendar/classes': 'Classes',
      'calendar/exams': 'Exams',
      'calendar/assignments': 'Assignments',
      //Academic
      'Academic/wolframengine/title':'Wolfram Engine',
      'Academic/wolframengine/caption':'Search anything by powerful Wolfram Engine',
      'Academic/gpacalculator/name':'GPA Calculator',
      'Academic/gpacalculator/caption':'Calculate your GPA easily',
      //me
      'me':'Me',
      'me/signout':'Sign out',
      //drawer
      'header/welcome':'Hello,',
      'e-payment':' E-Payment',
    },
    'zh': {
      'messages title': '消息',
      'calendar title': '日程',
      'academic title': '学术',
      'explore title': '发现',
      //Calendar
      'calendar/classes': '课程',
      'calendar/exams': '考试',
      'calendar/assignments': '作业',
      //Academic
      'Academic/wolframengine/title':'Wolfram 知识引擎',
      'Academic/wolframengine/caption':'利用强大的 Wolfram 引擎进行搜索',
      'Academic/gpacalculator/name':'GPA 计算器',
      'Academic/gpacalculator/caption':'轻松计算平均学分绩点',
      //me
      'me':'我',
      'me/signout':'登出',
      //drawer
      'header/welcome':'您好，',
      'e-payment':' E-Payment',
    }
  };

  String get(String title) {
    return _localizedValues[locale.languageCode][title];
  }

  static MainLocalizations of(BuildContext context) {
    return Localizations.of(context, MainLocalizations);
  }
}

class MainLocalizationsDelegate
    extends LocalizationsDelegate<MainLocalizations> {
  const MainLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<MainLocalizations> load(Locale locale) {
    return new SynchronousFuture<MainLocalizations>(
        new MainLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<MainLocalizations> old) {
    return false;
  }

  static MainLocalizationsDelegate delegate = const MainLocalizationsDelegate();
}
