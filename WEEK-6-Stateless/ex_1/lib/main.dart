import 'package:flutter/material.dart'; 

class HobbyCard extends StatelessWidget {
  const HobbyCard ({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  final String title;
  final IconData icon;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(icon, color: Colors.white),
            ),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 24))
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('My Hobbies')),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(title: 'Tavelling', icon: Icons.travel_explore, backgroundColor: Colors.green),
              HobbyCard(title: 'Skating', icon: Icons.skateboarding , backgroundColor: Colors.blueGrey),
              HobbyCard(title: 'Reading', icon: Icons.menu_book)
            ],
          ),
        ),
      ),
    )
  );
}