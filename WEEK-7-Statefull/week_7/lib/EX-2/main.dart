// import 'package:flutter/material.dart';
// import 'favorite_card.dart';

// void main() {
//   runApp(const MyApp(
    
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.blue,
//           title: const Text("Favorite cards"),
//         ),
//         body: Column(
//           children: [
//             FavoriteCard(isFavorite: true),
//             FavoriteCard(isFavorite: true),
//             FavoriteCard(isFavorite: true),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: true),
            FavoriteCard(isFavorite: true),
          ],
        ),
      ),
  )
);

class FavoriteCard extends StatefulWidget {
  final bool isFavorite;
  const FavoriteCard({super.key, required this.isFavorite});

  @override
  State <FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool isFavorite;
  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void _toggleFavorite () {
    setState(() {
      isFavorite = !isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey))
      ),
      child: Row(
        children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("title"),
              SizedBox(height: 10,),
              Text("description")
            ],
          )
        ),
        IconButton(
          onPressed: _toggleFavorite,
          icon: Icon(
            isFavorite? Icons.favorite: Icons.favorite_border,
            color: isFavorite? Colors.red: Colors.grey,
          ),
        ),
      ],
      ),
    );
  }
}
