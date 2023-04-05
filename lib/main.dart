import 'package:chatgpt_project/contraints.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBackdroundColor,
          appBarTheme: AppBarTheme(color: cardColor)),
      home: const HomePage(),
    );
  }
}
