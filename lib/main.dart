import 'package:demo_project/pages/home/home_page.dart';
import 'package:demo_project/providers/photo_provider.dart';
import 'package:demo_project/providers/post_provider.dart';
import 'package:demo_project/providers/preferences_provider.dart';
import 'package:demo_project/providers/todos_provider.dart';
import 'package:demo_project/providers/user_provider.dart';
import 'package:demo_project/utils/color_util.dart';
import 'package:demo_project/utils/style_util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PhotoProvider()),
        ChangeNotifierProvider(create: (_) => PreferencesProvider()),
        ChangeNotifierProvider(create: (_) => TodosProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider<PostProvider>(
          create: (context) {
            final preferencesProvider =
                Provider.of<PreferencesProvider>(context, listen: false);
            return PostProvider(preferencesProvider);
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: StyleUtil.style16DarkBlueBold,
        ),
        cardTheme: const CardTheme(
          surfaceTintColor: ColorUtil.colorWhite,
          shadowColor: ColorUtil.colorGrey,
          color: ColorUtil.colorWhite,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
            TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}
