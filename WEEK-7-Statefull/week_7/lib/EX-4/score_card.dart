import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
 
  final String title;
  const ScoreCard({super.key, required this.title});

  @override
  State<ScoreCard> createState() => __ScoreCardStateState();
}

class __ScoreCardStateState extends State<ScoreCard> {
  int maxScore = 10;
  int _score = 0;

  void decreass() {
    if (_score > 0) {
      setState(() => _score--);
    }
  }

  void increase() {
    if (_score < maxScore) {
      setState(() => _score++);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final color = Color.lerp(
      Colors.green[200],
      Colors.green[900],
      _score / maxScore
    )!;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 22, color: Colors.grey),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: decreass, icon: const Icon(Icons.remove)),
                IconButton(onPressed: increase, icon: Icon(Icons.add))
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: _score / maxScore,
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}