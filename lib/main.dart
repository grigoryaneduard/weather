import 'package:flutter/material.dart';
import 'package:weather/src/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/src/const/const.dart';

import 'src/shared/setup.dart';

void main() async {
  await setup();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
    path: 'assets/translations',
    fallbackLocale: defaultLang,
    child: const App(),
  ));
}
