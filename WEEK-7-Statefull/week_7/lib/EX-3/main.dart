import 'package:flutter/material.dart';

List<String> images = [
  "lib/EX-3/assets/bird.jpg",
  "lib/EX-3/assets/bird2.jpg",
  "lib/EX-3/assets/insect.jpg",
  "lib/EX-3/assets/girl.jpg",
  "lib/EX-3/assets/man.jpg",
];

void main() => runApp(
  MaterialApp(
    home: ImageGallery(),
  )
);

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State <ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State <ImageGallery> {
  int currentIndex = 0;

  void _onPrevious () {
    setState(() {
      if (currentIndex == 0) {
        currentIndex = images.length -1;
      } else {
        currentIndex --;
      }
    });
  }

  void _onNext () {
    setState(() {
      if (currentIndex == images.length -1) {
        currentIndex = 0;
      } else {
        currentIndex ++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Image Viewer"),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: _onPrevious,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: _onNext,
            ),
          )
        ],
      ),
      body: Image.asset(
        images[currentIndex],
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
