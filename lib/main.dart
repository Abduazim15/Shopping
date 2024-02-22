import 'package:flutter/material.dart';
import 'package:test_for_job/pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(int.parse('0xFFF0F0F0')),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.black26,
          showUnselectedLabels: true
        )
      ),
    );
  }
}
