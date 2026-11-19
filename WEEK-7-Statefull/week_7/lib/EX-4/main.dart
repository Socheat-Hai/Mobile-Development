
import 'package:flutter/material.dart';
import 'package:week_7/EX-4/score_card.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: ScoreScreen(),
));

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFAED85A),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: const [
            ScoreCard(title: 'My score in Flutter'),
            ScoreCard(title: 'My score in Dart'),
            ScoreCard(title: 'My score in React'),
          ],
        ),
      )
    );
  }
}