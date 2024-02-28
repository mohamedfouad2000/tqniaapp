import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/blocobserve.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Core/test/test.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tqniaapp/Core/utils/notification_Function.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';
import 'package:tqniaapp/Feature/splach/presentation/views/splach_view.dart';

final  navigatorKey= GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyAD43I9jKGD0SVs3qD9W-NrHTgP-l2GI3A',
              appId: '1:1091379967672:android:7510e341e58d5d8078a64d',
              messagingSenderId: '1091379967672',
              projectId: 'system-tqnia'),
        )
      : await Firebase.initializeApp();

  Bloc.observer = MyBlocObserver();
    FirebaseMessaging.onMessage.listen((event) {
      NotificationSound.onMessage(event);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      NotificationSound.onMessageOpenedApp(event);
    });
    FirebaseMessaging.onBackgroundMessage(
        NotificationSound.firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Tania',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          useMaterial3: true,
          
          fontFamily: 'Poppins',
          
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, surfaceTintColor: Colors.white),
          datePickerTheme: const DatePickerThemeData(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white),
          timePickerTheme: const TimePickerThemeData(
            backgroundColor: Colors.white,
            entryModeIconColor: Colors.white,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,
              surfaceTintColor: Colors.white),
          colorScheme: ColorScheme.fromSeed(seedColor: kMainColor).copyWith(
              background: const Color(0xFFFBFBFD), error: Colors.red)),
      home: const SplachView(),
    );
  }
}
