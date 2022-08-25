import 'package:bloc/bloc.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin/core/routes.dart';
import 'package:linkedin/core/themes.dart';
import 'package:linkedin/data/local/cache_helper.dart';
import 'package:linkedin/services/locator.dart';
import 'package:linkedin/presentation/view/splash_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'business_logic/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await ScreenUtil.ensureScreenSize();
  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );
  setUpLocator();

  CacheHelper.init();
  Bloc.observer = MyBlocObserver();

  runApp(LocalizedApp(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  Locale? _locale;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      builder: (context, child) => BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 2),
        child: MaterialApp(
          onGenerateRoute: AppRouter.onGenerateRoute,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          home: Directionality(
            textDirection: _locale?.languageCode == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: const SplashScreen(),
          ),
          theme: Themes.whiteTheme,
          localizationsDelegates: translator.delegates,
          locale: translator.activeLocale,
          supportedLocales: translator.locals(),
        ),
      ),
    );
  }
}
