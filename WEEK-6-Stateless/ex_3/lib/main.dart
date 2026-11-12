import 'package:material_ui/material_ui.dart';

enum Product {
  dart(
    title: 'Dart',
    description: 'Object Language',
    image: 'assets/ex3/dart.png',
  ),

  flutter(
    title: 'Flutter',
    description: 'Mobile widgets library',
    image: 'assets/ex3/flutter.png',
  ),

  firebase(
    title: 'Firebase',
    description: 'cloud database',
    image: 'assets/ex3/firebase.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({required this.title, required this.description, required this.image});
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, width: 60, height: 60),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            )
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
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              ProductCard(product: Product.flutter),
              ProductCard(product: Product.firebase)
            ],
          ),
        ),    
      ),
    )
  );
}