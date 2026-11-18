import 'package:flutter/material.dart';

class Favoritecard extends StatefulWidget {
 final bool _isFavorite;
 
  const Favoritecard({super.key,  this._isFavorite});

  @override
  State<Favoritecard> createState() => _FavoritecardState();
}

class _FavoritecardState extends State<Favoritecard>{
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget._isFavorite;
  }

  @override
  Widget build(BuildContext context) {
  return Container(
    decoration:  BoxDecoration(
      border: Border.all(color: Colors.grey, width: 1.0)
    ),
    alignment: Alignment.center,
    child:  Row(
      children: [
        Expanded(
          child: Column(children: [
            Text("Flutter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text("Flutter", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ],),
        ), 
        IconButton(
          onPressed: () {
            setState(() {
             _isFavorite = !widget._isFavorite;
            });
          },
          icon: Icon(Icons.favorite , color: Colors.red),
        )
      ],
    ),
  );
  }
}
