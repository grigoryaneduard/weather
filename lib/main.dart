import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/src/app.dart';
import 'package:easy_localization/easy_localization.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('ru', 'RU')],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: const App(),
  ));
}
