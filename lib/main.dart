import 'package:flutter/material.dart';
import 'package:simple_word_rearrange_game/pages/game_page.dart';
import 'package:simple_word_rearrange_game/pages/result_page.dart';
import 'package:simple_word_rearrange_game/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Word Rearrange Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: StartPage.routeName,
      routes: {
        StartPage.routeName: (context) => const StartPage(),
        GamePage.routeName: (context) => const GamePage(),
        ResultPage.routeName: (context) => const ResultPage(),
      },
    );
  }
}
