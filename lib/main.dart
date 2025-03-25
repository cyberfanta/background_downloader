import 'dart:ui';

import 'package:background_downloader/presentation/views/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/lang/ui_texts.dart';
import 'core/static_data/static_data.dart';
import 'data/models/login/login_cubit.dart';

void main() {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // MediaKit.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiBlocProvider(
        providers: [
          ChangeNotifierProvider<UiTexts>(
            create: (context) {
              Locale systemLocale = PlatformDispatcher.instance.locale;
              return UiTexts(systemLocale);
            },
          ),
          BlocProvider<MainCubit>(
            create: (context) => MainCubit(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // viewManager.init(LoginView.routeName);
    // FlutterNativeSplash.remove();

    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: MainView.routeName,
      routes: {
        MainView.routeName: (context) => const MainView(),
      },
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('es', 'ES'),
      ],
    );
  }
}
