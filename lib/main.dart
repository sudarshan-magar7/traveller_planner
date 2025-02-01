import 'package:flutter/material.dart';
import 'package:trip_planner_agency/widgets/theme.dart';
import 'package:trip_planner_agency/pages/home.dart';
import 'package:trip_planner_agency/pages/login.dart';
import 'package:trip_planner_agency/pages/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme, // Light Theme
        darkTheme: darkTheme, // Dark Theme
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/home': (context) => HomePage(),
          // '/profile': (context) => ProfilePage(),
          // '/login': (context) => LoginPage(),
        });
  }
}
