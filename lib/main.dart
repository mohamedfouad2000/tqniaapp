import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tqniaapp/Core/blocobserve.dart';
import 'package:tqniaapp/Core/local/cache_Helper.dart';
import 'package:tqniaapp/Core/remote/dio_helper.dart';
import 'package:tqniaapp/Core/utils/colors.dart';
import 'package:tqniaapp/Core/utils/size_config.dart';
import 'package:tqniaapp/Feature/splach/presentation/views/splach_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
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
