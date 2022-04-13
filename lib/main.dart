import 'package:badl/core/colors.dart';
import 'package:badl/core/constants.dart';
import 'package:badl/features/Home/presentation/pages/tabs_screen.dart';
import 'package:badl/features/Home/provider/ads_provider.dart';
import 'package:badl/features/Home/provider/category_provider.dart';
import 'package:badl/features/auth/provider/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

import 'core/providers/country_provider.dart';
import 'core/util/shared_pref_helper.dart';
import 'features/Home/provider/user_provider.dart';
import 'features/on_boarding_screen/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefsHelper.init();

  await translator.init(
    localeType: LocalizationDefaultType.asDefined,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/lang/',
  );

  runApp(
    LocalizedApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final isLogged = SharedPrefsHelper.getData(key: 'isLogged') ?? false;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<CategoryProvider>(
          create: (_) => CategoryProvider()..getMainCategory(),
        ),
        ChangeNotifierProvider<CountryProvider>(
          create: (_) => CountryProvider()..getCountry(),
        ),
        ChangeNotifierProvider<AdsProvider>(
          create: (_) => AdsProvider()..getLatestAds(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (_) => UserProvider()..getMyAds(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        builder: () => MaterialApp(
          color: MyColors.meanColor,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Tajawal',
            primarySwatch: Colors.blue,
          ),
          // initialRoute: onBoardingScreen,
          home: isLogged == true
              ? const TabsScreen()
              : OnBoardingScreen(),
          // onGenerateRoute: appRoute!.generateRoute,
          localizationsDelegates: translator.delegates,
          // Android + iOS Delegates
          locale: translator.activeLocale,
          // Active locale
          supportedLocales: translator.locals(),
        ),
      ),
    );
  }
}
